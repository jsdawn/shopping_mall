import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_mall/models/cart_info_model.dart';

class CartNotifier extends ChangeNotifier {
  final List<CartInfoModel> cartList = <CartInfoModel>[];

  setCartList(List<CartInfoModel> list) {
    cartList.clear();
    cartList.addAll(list);
    notifyListeners();
  }

  // 加入购物车
  void pushCart(CartInfoModel cartInfo) {
    int idx = cartList.indexWhere((item) => (item.id == cartInfo.id &&
        item.color == cartInfo.color &&
        item.size == cartInfo.size));
    if (idx > -1) {
      cartList[idx].count += cartInfo.count;
    } else {
      cartList.add(cartInfo);
    }
    notifyListeners();
  }

  // 商品数量加减
  void addOrReduceAction(int idx, String type) {
    if (type == 'add') {
      cartList[idx].count++;
    } else if (type == 'reduce') {
      cartList[idx].count--;
    }
    notifyListeners();
  }

  // 移除某项
  void remove(int idx) {
    cartList.removeAt(idx);
    notifyListeners();
  }

  // 清空购物车
  void clear() {
    cartList.clear();
    notifyListeners();
  }
}

final cartProvider = ChangeNotifierProvider.autoDispose<CartNotifier>((ref) {
  return CartNotifier();
});
