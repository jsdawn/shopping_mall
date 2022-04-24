import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';

class ShopTitleBlock extends StatelessWidget {
  const ShopTitleBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset(
              'assets/images/shop_logo.jpg',
              fit: BoxFit.cover,
              width: 35,
              height: 35,
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('夏日微风店铺'),
              Text(
                '★官方认证',
                style: TextStyle(color: AppTheme.primaryColor, fontSize: 12),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
