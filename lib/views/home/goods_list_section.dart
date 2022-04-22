import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/widgets/goods_list.dart';

class GoodsListSection extends StatelessWidget {
  const GoodsListSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: GoodsList(),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          color: AppTheme.chipBackground,
          child: Center(
            child: Text(
              '已经到底啦',
              style: AppTheme.caption.copyWith(letterSpacing: 1.8),
            ),
          ),
        ),
      ],
    );
  }
}
