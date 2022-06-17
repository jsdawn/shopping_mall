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
    required this.sold,
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
  int sold;
  String color;
  String size;
  List<String> images;
  int shopId;

  List<String> get colorOptions {
    return color.split(',');
  }

  List<String> get sizeOptions {
    return size.split(',');
  }

  factory GoodsModel.fromJson(Map<String, dynamic> json) => GoodsModel(
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        price: json["price"] ?? 0,
        originalPrice: json["originalPrice"] ?? 0,
        cover: json["cover"] ?? '',
        inventory: json["inventory"] ?? 0,
        sold: json["sold"] ?? 0,
        color: json["color"] ?? '',
        size: json["size"] ?? '',
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"].map((x) => x)),
        shopId: json["shopId"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "originalPrice": originalPrice,
        "cover": cover,
        "inventory": inventory,
        "sold": sold,
        "color": color,
        "size": size,
        "images": List<dynamic>.from(images.map((x) => x)),
        "shopId": shopId,
      };
}
