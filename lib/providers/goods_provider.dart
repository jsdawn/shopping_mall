import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_mall/models/goods_model.dart';

class GoodsNotifier extends StateNotifier<GoodsModel> {
  GoodsNotifier() : super(GoodsModel.fromJson({}));

  void setGoods(GoodsModel _goods) {
    state = _goods;
  }
}

/// 商品详情状态管理
final goodsProvider =
    StateNotifierProvider.autoDispose<GoodsNotifier, GoodsModel>((ref) {
  return GoodsNotifier();
});
