import 'package:flutter/material.dart';
import 'package:shopping_mall/components/navigation_with_view.dart';
import 'package:shopping_mall/views/goods/goods_index.dart';
import 'package:shopping_mall/views/home/home_index.dart';

class AppHomeScreen extends StatelessWidget {
  const AppHomeScreen({Key? key}) : super(key: key);

  // 底部导航与页面
  final List<NavIconData> _navigationWithViewItems = const [
    NavIconData(icon: Icons.home_outlined, label: '首页', body: HomeIndex()),
    NavIconData(
        icon: Icons.shopping_bag_outlined,
        label: '全部商品',
        body: Center(child: GoodsIndex())),
    NavIconData(
        icon: Icons.shopping_cart_outlined,
        label: '购物车',
        body: Center(child: Text('购物车'))),
    NavIconData(
        icon: Icons.account_circle_outlined,
        label: '我的',
        body: Center(child: Text('我的')))
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationWithView(
      items: _navigationWithViewItems,
    );
  }
}
