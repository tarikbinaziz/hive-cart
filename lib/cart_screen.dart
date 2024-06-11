import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_cart/cart/cart_repo.dart';
import 'package:hive_cart/hive/hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart List"),
      ),
      body: ValueListenableBuilder(
          valueListenable: Hive.box<HiveProduct>('cartBox').listenable(),
          builder: (context, Box box, w) {
            final cartItems = box.values.toList();
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        HiveProduct cartsingleItem = cartItems[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.2),
                              border:
                                  Border.all(color: Colors.amber, width: 2)),
                          child: ListTile(
                            leading: Image.network(
                                width: 60, cartsingleItem.thumbnail ?? ""),
                            title: Text(cartsingleItem.name ?? ""),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Quantity: ${cartsingleItem.quantity}'),
                                Text('Price: \$${cartsingleItem.price}'),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.remove_shopping_cart),
                              onPressed: () {
                                CartRepo().deleteCartItem(
                                  productId: cartsingleItem.id!,
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
