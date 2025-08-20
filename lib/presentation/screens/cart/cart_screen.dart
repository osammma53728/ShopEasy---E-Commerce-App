import 'package:flutter/material.dart';
import '../../../data/storage/hive_storage.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = HiveStorage.getCart();

    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            leading: Image.network(item["image"], height: 50, width: 50),
            title: Text(item["title"]),
            subtitle: Text("\$${item["price"]}"),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                HiveStorage.removeFromCart(item["id"]);
              },
            ),
          );
        },
      ),
    );
  }
}
