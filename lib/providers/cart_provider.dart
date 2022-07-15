import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_mall/models/cart_info_model.dart';

const cartPrefsKey = 'cartList';

// StateNotifierProvider 用法
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
    updCartPrefs();
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
    updCartPrefs();
  }

  // 设置购物车数量
  void updCartCount(CartInfoModel cartInfo, int count) {
    int idx = cartList.indexWhere((item) => (item.id == cartInfo.id &&
        item.color == cartInfo.color &&
        item.size == cartInfo.size));
    if (idx > -1) {
      cartList[idx].count = count;
    }
    notifyListeners();
    updCartPrefs();
  }

  // 移除某项-按索引
  void remove(int idx) {
    cartList.removeAt(idx);
    notifyListeners();
    updCartPrefs();
  }

  // 移除购物车项
  void renmoveCart(CartInfoModel cartInfo) {
    int idx = cartList.indexWhere((item) => (item.id == cartInfo.id &&
        item.color == cartInfo.color &&
        item.size == cartInfo.size));
    if (idx > -1) {
      remove(idx);
    }
  }

  // 清空购物车
  void clear() async {
    cartList.clear();
    notifyListeners();
    updCartPrefs();
  }

  // 更新 购物车 本地持久化
  void updCartPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    String cartString = json.encode(cartList).toString();
    prefs.setString(cartPrefsKey, cartString);
  }

  // 查询/初始化购物车
  Future<List<CartInfoModel>> getCartList() async {
    final prefs = await SharedPreferences.getInstance();
    String? _cartString = prefs.getString(cartPrefsKey);
    cartList.clear();
    // 本地数据初始化购物车
    if (_cartString != null) {
      List<CartInfoModel> _list = cartInfoModelListFromJson(_cartString);
      cartList.addAll(_list);
    }
    notifyListeners();
    return cartList;
  }
}

final cartProvider = ChangeNotifierProvider<CartNotifier>((ref) {
  return CartNotifier();
});
