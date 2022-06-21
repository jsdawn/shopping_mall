import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping_mall/models/goods_model.dart';
import 'package:shopping_mall/widgets/goods/goods_list_item.dart';

class GoodsList extends StatefulWidget {
  const GoodsList(this.list, {Key? key}) : super(key: key);

  final List<GoodsModel> list;

  @override
  State<GoodsList> createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
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
    return MasonryGridView.count(
      controller: _scrollController,
      padding: widget.list.isNotEmpty
          ? const EdgeInsets.symmetric(vertical: 12)
          : null,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 12,
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        return GoodsListItem(widget.list[index]);
      },
    );
  }
}
