import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/basic_app_bar.dart';
import 'package:shopping_mall/components/basic_button.dart';
import 'package:shopping_mall/models/cart_info_model.dart';
import 'package:shopping_mall/providers/cart_provider.dart';
import 'package:shopping_mall/widgets/goods/goods_cart_item.dart';
import 'package:shopping_mall/widgets/goods/goods_price.dart';

class CartIndex extends ConsumerStatefulWidget {
  const CartIndex({Key? key}) : super(key: key);

  @override
  ConsumerState<CartIndex> createState() => _CartIndexState();
}

class _CartIndexState extends ConsumerState<CartIndex> {
  @override
  Widget build(BuildContext context) {
    List<CartInfoModel> list =
        ref.watch(cartProvider.select((value) => value.cartList));

    return Scaffold(
      backgroundColor: AppTheme.chipBackground,
      appBar: const BasicAppBar(title: Text('购物车')),
      body: Column(children: [
        Expanded(
          child: list.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: list
                        .map((item) =>
                            GoodsCartItem(item, onChangeCount: (count) {
                              ref.read(cartProvider).updCartCount(item, count);
                              setState(() {});
                            }, onRemove: (item) {
                              ref.read(cartProvider).renmoveCart(item);
                            }))
                        .toList(),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.shopping_cart_outlined,
                        color: AppTheme.lightText),
                    Text(' 还没有购物', style: TextStyle(color: AppTheme.lightText)),
                  ],
                ),
        ),
        _footerBar(list)
      ]),
    );
  }

  Widget _footerBar(List<CartInfoModel> list) {
    double totalPrice =
        ref.watch(cartProvider.select((value) => value.totalPrice));
    int totalCount =
        ref.watch(cartProvider.select((value) => value.totalCount));

    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
        children: [
          Row(
            children: [const Text('总计：'), GoodsPrice(price: totalPrice)],
          ),
          BasicButton(
            onPressed: () {},
            size: BasicButtonSize.large,
            child: Text('去结算 ($totalCount)'),
          ),
        ],
      ),
    );
  }
}
