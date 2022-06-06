import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';

class GoodsPrice extends StatelessWidget {
  final double? price;
  final double? originalPrice;
  final GoodsPriceSize? size;

  const GoodsPrice(
      {Key? key,
      this.price = 0.0,
      this.originalPrice,
      this.size = GoodsPriceSize.normal})
      : super(key: key);

  double get textFontSize1 {
    if (size == GoodsPriceSize.large) {
      return 18;
    }
    return 12;
  }

  double get textFontSize2 {
    if (size == GoodsPriceSize.large) {
      return 24;
    }
    return 18;
  }

  double get textFontSize3 {
    if (size == GoodsPriceSize.large) {
      return 16;
    }
    return 11;
  }

  double get textFontSize4 {
    if (size == GoodsPriceSize.large) {
      return 16;
    }
    return 14;
  }

  String get price1 {
    if (price == null) return '0';
    List<String> arr = price!.toString().split('.');
    return arr[0];
  }

  String get price2 {
    if (price == null) return '0';
    List<String> arr = price!.toString().split('.');
    return arr[1];
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '￥',
        style: TextStyle(
            color: AppTheme.primaryColor,
            fontSize: textFontSize1,
            fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: price1,
            style: TextStyle(fontSize: textFontSize2),
          ),
          TextSpan(
            text: '.$price2 ',
            style: TextStyle(fontSize: textFontSize3),
          ),
          if (originalPrice != null)
            TextSpan(
              text: '￥$originalPrice',
              style: TextStyle(
                  color: AppTheme.deactivatedText,
                  fontSize: textFontSize4,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -0.8,
                  decoration: TextDecoration.lineThrough),
            ),
        ],
      ),
    );
  }
}

enum GoodsPriceSize {
  normal,
  large,
}
