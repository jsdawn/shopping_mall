import 'package:flutter/material.dart';
import 'package:shopping_mall/apis/api_util.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/basic_button.dart';
import 'package:shopping_mall/components/future_builder_snapshot.dart';
import 'package:shopping_mall/widgets/goods/goods_list.dart';

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  late Future _future;

  @override
  void initState() {
    super.initState();
    _future = ApiUtil.getGoodsList(page: 1, size: 20);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 5),
          child: Text(
            '热门商品',
            style: AppTheme.headline.copyWith(color: AppTheme.lightText),
          ),
        ),
        FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            return FutureBuilderSnapshot(
              context: context,
              snapshot: snapshot,
              builder: (data) {
                return _buildListUI(data, context);
              },
            );
          },
        ),
      ],
    );
  }
}

Widget _buildListUI(data, context) {
  void gotoGoods() {
    Navigator.of(context).pushNamed('/goods');
  }

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: GoodsList(data),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        color: AppTheme.chipBackground,
        alignment: Alignment.center,
        child: BasicButton.outline(
          onPressed: gotoGoods,
          child: const Text('前往查看更多'),
        ),
      )
    ],
  );
}
