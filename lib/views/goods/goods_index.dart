import 'package:flutter/material.dart';
import 'package:shopping_mall/apis/api_util.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/refresh_load_more_view.dart';
import 'package:shopping_mall/models/goods_model.dart';
import 'package:shopping_mall/views/goods/goods_header_section.dart';
import 'package:shopping_mall/widgets/goods/goods_list.dart';

class GoodsIndex extends StatefulWidget {
  const GoodsIndex({Key? key}) : super(key: key);

  @override
  State<GoodsIndex> createState() => _GoodsIndexState();
}

class _GoodsIndexState extends State<GoodsIndex> {
  bool _isFinished = false;
  List list = [];

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppTheme.nearlyWhite,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        // header section
        const GoodsHeaderSection(),
        // list container
        Expanded(
          child: RefreshLoadMoreView(
            isFinished: _isFinished,
            onLoadMore: () async {
              // await Future.delayed(const Duration(seconds: 2), () {});
              // List newList = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
              List<GoodsModel> newList = await ApiUtil.getGoodsList();
              if (!mounted) return;
              list.addAll(newList);
              if (list.length > 30) {
                _isFinished = true;
              }
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20, bottom: 20),
              child: GoodsList(list),
            ),
          ),
        ),
      ]),
    );
  }
}
