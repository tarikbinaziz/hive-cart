import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_cart/hive/hive_model.dart';
import 'package:hive_cart/models/all_products_list_model/product.dart';

class CartRepo {
  final Ref ref;
  CartRepo({required this.ref});

  static void addToCart({required Product product, context}) async {
    final cartBox = Hive.box<HiveProduct>("cartBox");
    final cartItems = cartBox.values.toList();

    debugPrint("cartitems $cartItems");

    /// convert product to hive model
    final cartData = HiveProduct(
      name: product.name,
      description: product.description,
      price: product.price,
      oldPrice: product.oldPrice,
      discountPercentage: product.discountPercentage,
      thumbnail: product.thumbnail,
      quantity: 1,
    );

    ///Print the IDs of items in the cart for debugging
    // debugPrint('Current cart items: ${cartItems.map((e) => e.id).toList()}');
    // debugPrint('Adding product ID: ${product.id}');

    // bool exists = cartItems.any((element) => element.id == product.id);

    // if (exists == true) {
    //   debugPrint('Element exists');
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       backgroundColor: Colors.red,
    //       content: Text(
    //         "Already added to cart",
    //         style: TextStyle(color: Colors.white),
    //       ),
    //     ),
    //   );
    // } else {
    //   await cartBox.add(cartData);
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text("Successfully added to cart"),
    //     ),
    //   );
    //   debugPrint('Element added');
    // }
  }

  HiveProduct? getCartItemById(
      {required int productId, required Box<HiveProduct> cartBox}) {
    final HiveProduct cartItem = cartBox.values.firstWhere((product) {
      return product.id == productId;
    });
    return cartItem;
  }

  void incrementProductQuantity(
      {required int productId,
      required Box<HiveProduct> box,
      required int index}) {
    final cartItem = getCartItemById(productId: productId, cartBox: box);
    if (cartItem != null) {
      cartItem.quantity++;
      box.putAt(index, cartItem);
    }
  }

  void decrementProductQuantity(
      {required int productId,
      required Box<HiveProduct> cartBox,
      required int index}) {
    final cartItem = getCartItemById(productId: productId, cartBox: cartBox);
    if (cartItem != null) {
      if (cartItem.quantity > 1) {
        cartItem.quantity--;
        cartBox.putAt(index, cartItem);
      } else {
        cartBox.deleteAt(index);
      }
    }
  }
}
