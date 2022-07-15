// To parse this JSON data, do
//
//     final cartInfoModel = cartInfoModelFromJson(jsonString);

import 'dart:convert';

List<CartInfoModel> cartInfoModelListFromJson(String str) =>
    List<CartInfoModel>.from(
        json.decode(str).map((x) => CartInfoModel.fromJson(x)));

CartInfoModel cartInfoModelFromJson(String str) =>
    CartInfoModel.fromJson(json.decode(str));

String cartInfoModelToJson(CartInfoModel data) => json.encode(data.toJson());

class CartInfoModel {
  CartInfoModel({
    required this.id,
    required this.title,
    required this.price,
    required this.cover,
    required this.count,
    required this.color,
    required this.size,
  });

  int id;
  String title;
  double price;
  String cover;
  int count;
  String color;
  String size;

  factory CartInfoModel.fromJson(Map<String, dynamic> json) => CartInfoModel(
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        price: json["price"] ?? 0.0,
        cover: json["cover"] ?? '',
        count: json["count"] ?? 0,
        color: json["color"] ?? '',
        size: json["size"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "cover": cover,
        "count": count,
        "color": color,
        "size": size,
      };
}
