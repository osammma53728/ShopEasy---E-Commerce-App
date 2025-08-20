import 'package:e_commerce/domain/entities/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    if (!state.any((p) => p.id == product.id)) {
      state = [...state, product];
    }
  }

  void removeFromCart(Product product) {
    state = state.where((p) => p.id != product.id).toList();
  }

  void clearCart() {
    state = [];
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>(
  (ref) => CartNotifier(),
);
