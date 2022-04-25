import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/basic_button.dart';

class GoodsPropsPannel extends StatefulWidget {
  const GoodsPropsPannel({Key? key}) : super(key: key);

  @override
  State<GoodsPropsPannel> createState() => _GoodsPropsPannelState();
}

class _GoodsPropsPannelState extends State<GoodsPropsPannel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      color: AppTheme.nearlyWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _goodsSimpleInfo(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: BasicButton(
              onPressed: () {},
              size: BasicButtonSize.large,
              child: const Text('确认'),
            ),
          )
        ],
      ),
    );
  }

  Widget _goodsSimpleInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Image.network(
            'https://unpkg.com/@jsdawn/assets/images/mall/Clothes1.jpg',
            fit: BoxFit.contain,
            width: 90,
            height: 90,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RichText(
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text(
                  '库存 286',
                  style: AppTheme.caption.copyWith(fontSize: 14),
                ),
              ),
              const Text('已选 04白色, L'),
            ],
          ),
        )
      ],
    );
  }
}
