// To parse this JSON data, do
//
//     final cartInfoModel = cartInfoModelFromJson(jsonString);

import 'dart:convert';

CartInfoModel cartInfoModelFromJson(String str) =>
    CartInfoModel.fromJson(json.decode(str));

String cartInfoModelToJson(CartInfoModel data) => json.encode(data.toJson());

class CartInfoModel {
  CartInfoModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.count,
    required this.color,
    required this.size,
  });

  int id;
  String title;
  double price;
  String image;
  int count;
  String color;
  String size;

  factory CartInfoModel.fromJson(Map<String, dynamic> json) => CartInfoModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        image: json["image"],
        count: json["count"],
        color: json["color"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "image": image,
        "count": count,
        "color": color,
        "size": size,
      };
}
