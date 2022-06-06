import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/basic_app_bar.dart';
import 'package:shopping_mall/components/num_counter.dart';
import 'package:shopping_mall/models/cart_info_model.dart';
import 'package:shopping_mall/providers/cart_provider.dart';
import 'package:shopping_mall/widgets/goods/goods_price.dart';

class CartIndex extends ConsumerWidget {
  const CartIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTheme.chipBackground,
      appBar: const BasicAppBar(title: Text('购物车')),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: _cartList(ref),
          ),
        ),
        _footerBar()
      ]),
    );
  }

  Widget _cartList(WidgetRef ref) {
    List<CartInfoModel> list =
        ref.watch(cartProvider.select((value) => value.cartList));
    return Column(
      children: list
          .map((item) => Container(
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
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          '${item.color}/${item.size}',
                          style: AppTheme.caption,
                        ),
                      ),
                      Row(
                        children: const [GoodsPrice(), NumCounter(count: 1)],
                      )
                    ],
                  ))
                ],
              )))
          .toList(),
    );
  }

  Widget _footerBar() {
    return Text('data');
  }
}
