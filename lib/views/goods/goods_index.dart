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

class _GoodsIndexState extends State<GoodsIndex>
    with AutomaticKeepAliveClientMixin {
  bool _isFinished = false;
  List<GoodsModel> list = [];
  int page = 1;
  int size = 20;
  late ScrollController _scrollController;

  @override
  bool get wantKeepAlive => true;

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
    super.build(context);
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
              List<GoodsModel> newList =
                  await ApiUtil.getGoodsList(page: page, size: size);
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
              padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20, bottom: 20),
              child: GoodsList(
                list,
                controller: _scrollController,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
