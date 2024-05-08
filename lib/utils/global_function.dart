import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class GlobalFunction {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();




 

  static void showCustomSnackbar({
    required String message,
    required bool isSuccess,
    bool isTop = false,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      dismissDirection:
          isTop ? DismissDirection.startToEnd : DismissDirection.down,
      backgroundColor: isSuccess ? Colors.amber : Colors.red,
      content: Text(message),
      margin: isTop
          ? EdgeInsets.only(
              bottom: MediaQuery.of(navigatorKey.currentState!.context)
                      .size
                      .height -
                  160,
              right: 20,
              left: 20,
            )
          : null,
    );
    ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
      snackBar,
    );
  }




}
