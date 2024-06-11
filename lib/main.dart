import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_cart/hive/hive_model.dart';
import 'package:hive_cart/home.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();
  // Register Adapter
  Hive.registerAdapter(CartAdapter());
  // Open cart box
  await Hive.openBox<HiveProduct>('cartBox');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
