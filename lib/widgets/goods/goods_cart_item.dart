import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/num_counter.dart';
import 'package:shopping_mall/models/cart_info_model.dart';
import 'package:shopping_mall/widgets/goods/goods_price.dart';

class GoodsCartItem extends StatelessWidget {
  final CartInfoModel item;
  final void Function(int)? onChangeCount;

  const GoodsCartItem(this.item, {Key? key, this.onChangeCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 1),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        color: AppTheme.nearlyWhite,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Image.asset(
                  'assets/images/book1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  item.title,
                  style: AppTheme.body1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    '${item.color}/${item.size}',
                    style: AppTheme.caption,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GoodsPrice(price: item.price),
                    NumCounter(
                      count: item.count,
                      onChange: onChangeCount,
                    )
                  ],
                )
              ],
            ))
          ],
        ));
  }
}
