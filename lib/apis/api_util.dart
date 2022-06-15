import 'package:flutter/services.dart';
import 'package:shopping_mall/models/goods_model.dart';

class ApiUtil {
  static Future<List<GoodsModel>> getGoodsList() async {
    String jsonString = await rootBundle.loadString('assets/json/data.json');
    return goodsModelListFromJson(jsonString);
  }
}
