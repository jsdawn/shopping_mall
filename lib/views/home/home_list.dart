import 'package:flutter/material.dart';
import 'package:shopping_mall/apis/api_util.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/basic_button.dart';
import 'package:shopping_mall/components/future_builder_snapshot.dart';
import 'package:shopping_mall/widgets/goods/goods_list.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void gotoGoods() {
      Navigator.of(context).pushNamed('/goods');
    }

    return FutureBuilder(
        future: ApiUtil.getGoodsList(page: 1, size: 20),
        builder: (context, snapshot) {
          return FutureBuilderSnapshot(
            context: context,
            snapshot: snapshot,
            builder: (data) {
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
            },
          );
        });
  }
}
