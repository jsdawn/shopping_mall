import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping_mall/widgets/goods_list_item.dart';

class GoodsList extends StatelessWidget {
  const GoodsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 12,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const GoodsListItem();
      },
    );
  }
}
