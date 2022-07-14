import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_mall/models/cart_info_model.dart';

class CartNotifier extends ChangeNotifier {
  final List<CartInfoModel> cartList = <CartInfoModel>[];

  int get totalCount {
    int total = 0;
    for (var item in cartList) {
      total += item.count;
    }
    return total;
  }

  double get totalPrice {
    double total = 0;
    for (var item in cartList) {
      total += item.price * item.count;
    }
    return total;
  }

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
      // 深拷贝
      cartList.add(cartInfoModelFromJson(cartInfoModelToJson(cartInfo)));
    }
    notifyListeners();
  }

  // 加入购物车
  void updCartCount(CartInfoModel cartInfo, int count) {
    int idx = cartList.indexWhere((item) => (item.id == cartInfo.id &&
        item.color == cartInfo.color &&
        item.size == cartInfo.size));
    if (idx > -1) {
      cartList[idx].count = count;
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

final cartProvider = ChangeNotifierProvider<CartNotifier>((ref) {
  return CartNotifier();
});
