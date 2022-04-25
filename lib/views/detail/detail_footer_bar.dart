import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/basic_button.dart';
import 'package:shopping_mall/widgets/goods/goods_props_pannel.dart';

class DetailFooterBar extends StatelessWidget {
  const DetailFooterBar({Key? key}) : super(key: key);

  static double height = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: AppTheme.nearlyWhite,
        border: Border(
            top: BorderSide(
          color: AppTheme.notWhite,
          width: 1,
        )),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _footerIconButton(Icons.home_outlined, '首页'),
                _footerIconButton(Icons.shopping_cart_outlined, '购物车'),
                _footerIconButton(Icons.account_circle_outlined, '我的'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: BasicButton(
              onPressed: () {
                _showGoodsPropsSheet(context);
              },
              child: const Text('加入购物车'),
              size: BasicButtonSize.large,
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerIconButton(IconData iconData, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: 25),
          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Text(label, style: AppTheme.caption.copyWith(fontSize: 11)),
          ),
        ],
      ),
    );
  }

  void _showGoodsPropsSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext ctx) {
          return Container(
            child: GoodsPropsPannel(),
          );
        });
  }
}
