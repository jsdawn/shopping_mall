import 'package:flutter/services.dart';
import 'package:shopping_mall/models/goods_model.dart';

class ApiUtil {
  /// 获取商品列表
  static Future<List<GoodsModel>> getGoodsList({
    int? page,
    int? size = 10,
    String? category,
  }) async {
    // Json模拟请求
    String jsonString =
        await rootBundle.loadString('assets/json/mock_goods_list.json');
    await Future.delayed(const Duration(milliseconds: 500));
    List<GoodsModel> list = goodsModelListFromJson(jsonString);
    if (page == null) return list;

    int start = (page - 1) * size!;
    int end = page * size;
    if (start >= list.length) return [];
    return list.sublist(start, end >= list.length ? null : end);
  }

  /// 获取商品详情
  static Future<GoodsModel> getGoodsDetail(int id) async {
    List<GoodsModel> list = await ApiUtil.getGoodsList();
    GoodsModel detail = list.firstWhere((item) => item.id == id,
        orElse: () => GoodsModel.fromJson({}));
    return detail;
  }
}
