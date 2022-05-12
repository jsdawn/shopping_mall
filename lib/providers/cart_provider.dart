import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_mall/models/cart_info_model.dart';

class CartNotifier extends ChangeNotifier {
  List<CartInfoModel> cartList = <CartInfoModel>[];

  setCartList(List<CartInfoModel> list) {
    cartList = list;
    notifyListeners();
  }

  // 更新列表
  update(CartInfoModel cartInfo) {
    cartList.removeWhere((item) => item.id == cartInfo.id);
    cartList.add(cartInfo);
    notifyListeners();
  }

  // 移除某项
  remove(int id) {
    cartList.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  // 清空购物车
  clear() {
    cartList.clear();
    notifyListeners();
  }

  // 商品数量加减
  addOrReduceAction(int id, String type) {
    int idx = cartList.indexWhere((item) => item.id == id);
    if (type == 'add') {
      cartList[idx].count++;
    } else if (type == 'reduce') {
      cartList[idx].count--;
    }
    notifyListeners();
  }
}

final cartProvider = ChangeNotifierProvider<CartNotifier>((ref) {
  return CartNotifier();
});
