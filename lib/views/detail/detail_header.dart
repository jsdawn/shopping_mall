import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';

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
              children: [
                _priceCell(),
                const Text('已售 162', style: AppTheme.caption)
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

  Widget _priceCell() {
    return RichText(
      text: const TextSpan(
        text: '￥',
        style: TextStyle(
            color: AppTheme.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: '59',
            style: TextStyle(fontSize: 24),
          ),
          TextSpan(
            text: '.09 ',
            style: TextStyle(fontSize: 16),
          ),
          if (true)
            TextSpan(
              text: '￥69.9',
              style: TextStyle(
                  color: AppTheme.deactivatedText,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -0.8,
                  decoration: TextDecoration.lineThrough),
            ),
        ],
      ),
    );
  }
}
