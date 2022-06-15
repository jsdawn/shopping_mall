// To parse this JSON data, do
//
//     final goodsModel = goodsModelFromJson(jsonString);

import 'dart:convert';

List<GoodsModel> goodsModelListFromJson(String str) =>
    List<GoodsModel>.from(json.decode(str).map((x) => GoodsModel.fromJson(x)));

GoodsModel goodsModelFromJson(String str) =>
    GoodsModel.fromJson(json.decode(str));

String goodsModelToJson(GoodsModel data) => json.encode(data.toJson());

class GoodsModel {
  GoodsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.cover,
    required this.inventory,
    required this.count,
    required this.color,
    required this.size,
    required this.images,
    required this.shopId,
  });

  int id;
  String title;
  double price;
  double originalPrice;
  String cover;
  int inventory;
  int count;
  String color;
  String size;
  List<String> images;
  int shopId;

  factory GoodsModel.fromJson(Map<String, dynamic> json) => GoodsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        originalPrice: json["originalPrice"],
        cover: json["cover"],
        inventory: json["inventory"],
        count: json["count"],
        color: json["color"],
        size: json["size"],
        images: List<String>.from(json["images"].map((x) => x)),
        shopId: json["shopId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "originalPrice": originalPrice,
        "cover": cover,
        "inventory": inventory,
        "count": count,
        "color": color,
        "size": size,
        "images": List<dynamic>.from(images.map((x) => x)),
        "shopId": shopId,
      };
}
