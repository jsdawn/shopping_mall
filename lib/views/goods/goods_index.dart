import 'package:flutter/material.dart';
import 'package:shopping_mall/views/goods/goods_list_index.dart';

class GoodsIndex extends StatefulWidget {
  const GoodsIndex({Key? key}) : super(key: key);

  @override
  State<GoodsIndex> createState() => _GoodsIndexState();
}

class _GoodsIndexState extends State<GoodsIndex>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const GoodsListIndex();
  }
}
