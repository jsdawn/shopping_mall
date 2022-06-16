import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/models/goods_model.dart';
import 'package:shopping_mall/providers/goods_provider.dart';
import 'package:shopping_mall/widgets/goods/goods_price.dart';

class DetailHeader extends ConsumerWidget {
  const DetailHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GoodsModel goodsDetail = ref.watch(goodsProvider);

    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      color: AppTheme.nearlyWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 2,
            child: Image.network(goodsDetail.cover, fit: BoxFit.contain),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GoodsPrice(
                  price: goodsDetail.price,
                  originalPrice: 69.09,
                  size: GoodsPriceSize.large,
                ),
                Text('已售 ${goodsDetail.sold}', style: AppTheme.caption)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Text(
              goodsDetail.title,
              style: const TextStyle(fontSize: 16, color: AppTheme.darkerText),
            ),
          ),
        ],
      ),
    );
  }
}
