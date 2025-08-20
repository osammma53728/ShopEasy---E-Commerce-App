import 'package:hive/hive.dart';
import '../../domain/entities/product.dart';

class HiveStorage {
  static late Box _cartBox;
  static late Box _favoritesBox;

  static Future<void> init() async {
    _cartBox = await Hive.openBox('cart');
    _favoritesBox = await Hive.openBox('favorites');
  }

  static void addToCart(Product product) {
    _cartBox.put(product.id, product.toJson());
  }

  static void removeFromCart(int id) {
    _cartBox.delete(id);
  }

  static List<Map> getCart() {
    return _cartBox.values.cast<Map>().toList();
  }

  static void addToFavorites(Product product) {
    _favoritesBox.put(product.id, product.toJson());
  }

  static void removeFromFavorites(int id) {
    _favoritesBox.delete(id);
  }

  static List<Map> getFavorites() {
    return _favoritesBox.values.cast<Map>().toList();
  }
}
