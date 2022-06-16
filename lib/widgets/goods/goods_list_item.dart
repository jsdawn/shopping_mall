import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/models/goods_model.dart';
import 'package:shopping_mall/widgets/goods/goods_price.dart';

class GoodsListItem extends StatelessWidget {
  const GoodsListItem(this.goods, {Key? key}) : super(key: key);

  final GoodsModel goods;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/detail', arguments: {'id': goods.id});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Image.network(goods.cover, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              goods.title,
              style: AppTheme.body1,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: GoodsPrice(
              price: goods.price,
              originalPrice: goods.originalPrice,
            ),
          )
        ],
      ),
    );
  }
}
