import 'package:flutter/services.dart';
import 'package:shopping_mall/models/goods_model.dart';

class ApiUtil {
  /// 获取商品列表
  static Future<List<GoodsModel>> getGoodsList({
    int? page,
    int? size = 10,
  }) async {
    // Json模拟请求
    String jsonString =
        await rootBundle.loadString('assets/json/mock_goods_list.json');
    await Future.delayed(const Duration(seconds: 1));
    int start = (page! - 1) * size!;
    int end = page * size;
    List<GoodsModel> list = goodsModelListFromJson(jsonString);
    if (page.isNaN) return list;
    if (start >= list.length) return [];
    return list.sublist(start, end >= list.length ? null : end);
  }

  static Future<GoodsModel> getGoodsDetail(int id) async {
    List<GoodsModel> list = await ApiUtil.getGoodsList();
    return list.firstWhere((item) => item.id == id);
  }
}
