import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_mall/apis/api_util.dart';
import 'package:shopping_mall/models/goods_model.dart';

// StateNotifierProvider 用法
class GoodsNotifier extends StateNotifier<GoodsModel> {
  GoodsNotifier() : super(GoodsModel.fromJson({}));

  void setGoods(GoodsModel _goods) {
    state = _goods;
  }

  // 从后台获取商品数据
  Future<GoodsModel> getGoodsInfo(int id) async {
    GoodsModel res = await ApiUtil.getGoodsDetail(id);
    state = res;
    return res;
  }
}

/// 商品详情状态管理
final goodsProvider = StateNotifierProvider<GoodsNotifier, GoodsModel>((ref) {
  return GoodsNotifier();
});
