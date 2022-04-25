import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/basic_button.dart';
import 'package:shopping_mall/widgets/goods/goods_list.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 12),
          color: AppTheme.chipBackground,
          child: Center(
            child: BasicButton.outline(
              onPressed: () {},
              child: const Text('前往查看更多'),
            ),
          ),
        ),
      ],
    );
  }
}
