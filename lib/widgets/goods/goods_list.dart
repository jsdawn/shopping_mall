import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping_mall/models/goods_model.dart';
import 'package:shopping_mall/widgets/goods/goods_list_item.dart';

class GoodsList extends StatelessWidget {
  const GoodsList(this.list, {Key? key, this.controller}) : super(key: key);

  final List<GoodsModel> list;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      controller: controller,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 12,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return GoodsListItem(list[index]);
      },
    );
  }
}
