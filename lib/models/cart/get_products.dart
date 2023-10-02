// import 'dart:convert';

import '../../utils/exports.dart';

List<GetCart> getCartFromJson(String str) =>
    List<GetCart>.from(json.decode(str).map((x) => GetCart.fromJson(x)));

class GetCart {
  List<Product> products;

  GetCart({
    required this.products,
  });

  factory GetCart.fromJson(Map<String, dynamic> json) => GetCart(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );
}

// class Product {
//   ProductItem cartItem;
//   int quantity;
//   String id;

//   Product({
//     required this.cartItem,
//     required this.quantity,
//     required this.id,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         cartItem: ProductItem.fromJson(json["cartItem"]),
//         quantity: json["quantity"] ?? 0,
//         id: json["_id"] ?? '',
//       );
// }

// class ProductItem {
//   String id;
//   String name;
//   String category;
//   List<String> imageUrl;
//   String price;

//   ProductItem({
//     required this.id,
//     required this.name,
//     required this.category,
//     required this.imageUrl,
//     required this.price,
//   });

//   factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
//         id: json["_id"],
//         name: json["name"],
//         category: json["category"],
//         imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
//         price: json["price"],
//       );
// }

class Product {
  final String id;
  final String userId;
  final List<ProductItem> products;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Product({
    required this.id,
    required this.userId,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        userId: json["userId"],
        products: List<ProductItem>.from(
            json["products"].map((x) => ProductItem.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class ProductItem {
  final int quantity;
  final String id;

  ProductItem({
    required this.quantity,
    required this.id,
  });

  factory ProductItem.fromRawJson(String str) =>
      ProductItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        quantity: json["quantity"] ?? 0,
        id: json["_id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "_id": id,
      };
}
