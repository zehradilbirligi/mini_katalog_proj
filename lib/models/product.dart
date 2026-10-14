import 'package:flutter/material.dart';

/// Katalogdaki her bir ürünü temsil eden model sınıfı.
/// JSON verisinden (assets/data/products.json) okunur ve
/// fromJson / toJson metotları ile dönüştürülür.
class Product {
  final int id;
  final String name;
  final String category;
  final double price;
  final String description;
  final String colorHex;
  final String iconName;
  final List<String> specs;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.colorHex,
    required this.iconName,
    required this.specs,
    required this.imageUrl,
  });

  /// JSON (Map) verisinden Product nesnesi oluşturur.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      colorHex: json['colorHex'] as String,
      iconName: json['iconName'] as String,
      specs: List<String>.from(json['specs'] as List),
      imageUrl: json['imageUrl'] as String,
    );
  }

  /// Product nesnesini JSON (Map) formatına çevirir.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
      'description': description,
      'colorHex': colorHex,
      'iconName': iconName,
      'specs': specs,
      'imageUrl': imageUrl,
    };
  }

  /// colorHex ("#RRGGBB") değerini Flutter Color nesnesine çevirir.
  Color get color {
    final hex = colorHex.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  /// iconName string değerine karşılık gelen IconData döner.
  IconData get icon {
    switch (iconName) {
      case 'headset':
        return Icons.headset;
      case 'headphones':
        return Icons.headphones;
      case 'speaker':
        return Icons.speaker;
      case 'speaker_group':
        return Icons.speaker_group;
      case 'smartphone':
        return Icons.smartphone;
      case 'laptop_mac':
        return Icons.laptop_mac;
      case 'tablet_mac':
        return Icons.tablet_mac;
      case 'watch':
        return Icons.watch;
      default:
        return Icons.shopping_bag;
    }
  }
}
