import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';

class GoodsListItem extends StatelessWidget {
  const GoodsListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/detail');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Image.asset(
                'assets/images/book1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              '加厚加宽衣服，升级版衣服你值得拥有升级版衣服你值得拥有升级版衣服你值得拥有',
              style: AppTheme.body1,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: _priceCell(),
          )
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
            fontSize: 12,
            fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: '59',
            style: TextStyle(fontSize: 18),
          ),
          TextSpan(
            text: '.09 ',
            style: TextStyle(fontSize: 11),
          ),
          if (true)
            TextSpan(
              text: '￥69.9',
              style: TextStyle(
                  color: AppTheme.deactivatedText,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -0.8,
                  decoration: TextDecoration.lineThrough),
            ),
        ],
      ),
    );
  }
}
