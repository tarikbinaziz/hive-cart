import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_cart/hive/hive_model.dart';
import 'package:hive_cart/models/all_products_list_model/product.dart';

class CartRepo {
  CartRepo();

  void addToCart(
      {required Product product, required BuildContext context}) async {
    final cartBox = Hive.box<HiveProduct>("cartBox");
    final cartData = HiveProduct(
      name: product.name,
      description: product.description,
      price: product.price,
      oldPrice: product.oldPrice,
      discountPercentage: product.discountPercentage,
      thumbnail: product.thumbnail,
      quantity: 1,
    );


    if (isProductInCart(product, cartBox)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Product already in cart"),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      cartBox.add(cartData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Product added to cart"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  bool isProductInCart(Product product, Box<HiveProduct> cartBox) {
    for (var i = 0; i < cartBox.length; i++) {
      HiveProduct cartItem = cartBox.getAt(i)!;
      debugPrint("cartbox ${cartItem.toMap()}");
      if (cartItem.name == product.name) {
        return true;
      }
    }
    return false;
  }

  // HiveProduct? getCartItemById(
  //     {required int productId, required Box<HiveProduct> cartBox}) {
  //   final HiveProduct cartItem = cartBox.values.firstWhere((product) {
  //     return product.id == productId;
  //   });
  //   return cartItem;
  // }

  static HiveProduct? getCartItemById(
      {int? productId, required Box<HiveProduct> cartBox}) {
    if (productId == null) {
      return null; // Return null if productId is null
    }
    try {
      final HiveProduct? cartItem = cartBox.values.firstWhere(
        (product) {
          return product.id == productId;
        },
      );
      return cartItem;
    } catch (e) {
      return null; // Return null if there's an error or if the item is not found
    }
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
