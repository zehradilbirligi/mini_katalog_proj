import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/product.dart';

/// Gerçek bir API çağrısını simüle eden servis sınıfı.
///
/// Not: Eğitim kapsamında gerçek bir e-ticaret altyapısı kullanılmamaktadır.
/// Bunun yerine assets/data/products.json dosyası, bir API'den dönen
/// JSON yanıtı gibi ele alınıp dart:convert ile parse edilmektedir.
/// Gerçek bir API'ye bağlanmak isterseniz http paketini ekleyip
/// Fake Store API (https://fakestoreapi.com/products) ya da
/// DummyJSON (https://dummyjson.com/products) kullanabilirsiniz.
class ProductService {
  static Future<List<Product>> fetchProducts() async {
    // Ağ gecikmesini simüle etmek için kısa bir bekleme
    await Future.delayed(const Duration(milliseconds: 400));

    final String jsonString =
        await rootBundle.loadString('assets/data/products.json');
    final List<dynamic> jsonData = json.decode(jsonString) as List<dynamic>;

    return jsonData
        .map((item) => Product.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
