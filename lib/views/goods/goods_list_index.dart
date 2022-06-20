import 'package:flutter/material.dart';
import 'package:shopping_mall/apis/api_util.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/basic_app_bar.dart';
import 'package:shopping_mall/components/refresh_load_more_view.dart';
import 'package:shopping_mall/models/goods_model.dart';
import 'package:shopping_mall/utils/helper_util.dart';
import 'package:shopping_mall/widgets/goods/goods_list.dart';

class GoodsListIndex extends StatefulWidget {
  const GoodsListIndex({Key? key}) : super(key: key);

  @override
  State<GoodsListIndex> createState() => _GoodsListIndexState();
}

class _GoodsListIndexState extends State<GoodsListIndex> {
  bool _isFinished = false;
  List<GoodsModel> list = [];
  int page = 1;
  int size = 20;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? category = HelperUtil.getRouteParam(context, 'category');

    return Scaffold(
      backgroundColor: AppTheme.nearlyWhite,
      appBar: BasicAppBar(title: Text(category ?? '全部商品')),
      body: RefreshLoadMoreView(
        isFinished: _isFinished,
        onLoadMore: () async {
          List<GoodsModel> newList = await ApiUtil.getGoodsList(
              page: page, size: size, category: category);
          if (!mounted) return;
          list.addAll(newList);
          // 数据不足一页 - 没有更多，加载完成
          if (newList.length < size) {
            _isFinished = true;
          }
          page++;
          setState(() {});
        },
        child: Padding(
          padding:
              const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
          child: GoodsList(
            list,
            controller: _scrollController,
          ),
        ),
      ),
    );
  }
}
