import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/widgets/goods/goods_price.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      color: AppTheme.nearlyWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 2,
            child: Image.network(
              'https://unpkg.com/@jsdawn/assets/images/mall/Clothes1.jpg',
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                GoodsPrice(
                  price: 59.09,
                  originalPrice: 69.09,
                  size: GoodsPriceSize.large,
                ),
                Text('已售 162', style: AppTheme.caption)
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Text(
              '热风2022年春季新款趣味卫衣卫衣卫衣卫衣F20W2114',
              style: TextStyle(fontSize: 16, color: AppTheme.darkerText),
            ),
          ),
        ],
      ),
    );
  }
}
