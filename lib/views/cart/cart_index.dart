import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_mall/models/cart_info_model.dart';
import 'package:shopping_mall/providers/cart_provider.dart';

class CartIndex extends ConsumerWidget {
  const CartIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _cartList(ref);
  }

  Widget _cartList(WidgetRef ref) {
    List<CartInfoModel> list =
        ref.watch(cartProvider.select((value) => value.cartList));
    return Column(
      children: list
          .map((item) => Text(
              'name:${item.name},color:${item.color},size:${item.size},count:${item.count}'))
          .toList(),
    );
  }
}
