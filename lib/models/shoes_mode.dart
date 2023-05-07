import 'package:flutter/material.dart';

class Sneakers with ChangeNotifier {
  final String id;
  final String name;
  final String category;
  final List<String> imageUrl;
  final String oldPrice;
  final List<Map<String, dynamic>> sizes;
  final String price;
  final String description;
  final String title;

  Sneakers({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.oldPrice,
    required this.sizes,
    required this.price,
    required this.description,
    required this.title,
  });

  factory Sneakers.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> sizesJson =
        List<Map<String, dynamic>>.from(json['sizes']);
    List<Map<String, dynamic>> sizes = sizesJson
        .map((size) => {'size': size['size'], 'isSelected': size['isSelected']})
        .toList();

    return Sneakers(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      imageUrl: List<String>.from(json['imageUrl']),
      oldPrice: json['oldPrice'],
      sizes: sizes,
      price: json['price'],
      description: json['description'],
      title: json['title'],
    );
  }
}
