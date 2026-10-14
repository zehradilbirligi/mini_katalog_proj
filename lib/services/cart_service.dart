import 'package:flutter/foundation.dart';
import '../models/product.dart';

/// Basit bir sepet (cart) state güncelleme simülasyonu.
///
/// Uygulama genelinde tek bir örnek (singleton) üzerinden erişilir.
/// ValueNotifier sayesinde sepet güncellendiğinde dinleyen widget'lar
/// (örn. AppBar üzerindeki sepet rozeti) otomatik olarak yeniden çizilir.
class CartService {
  CartService._internal();
  static final CartService instance = CartService._internal();

  final List<Product> _items = [];
  final ValueNotifier<int> itemCount = ValueNotifier<int>(0);

  List<Product> get items => List.unmodifiable(_items);

  double get totalPrice =>
      _items.fold(0.0, (sum, product) => sum + product.price);

  void addToCart(Product product) {
    _items.add(product);
    itemCount.value = _items.length;
  }

  void removeAt(int index) {
    _items.removeAt(index);
    itemCount.value = _items.length;
  }

  void clear() {
    _items.clear();
    itemCount.value = 0;
  }
}
