import 'package:hive_cart/hive/hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';


class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CartAdapter());
    await Hive.openBox<HiveProduct>('cartBox');
  }

  static Box<HiveProduct> getCartBox() {
    return Hive.box<HiveProduct>('cartBox');
  }
}
