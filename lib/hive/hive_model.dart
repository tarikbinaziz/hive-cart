import 'package:hive_flutter/hive_flutter.dart';

class HiveProduct {
  int? id;
  String? name;
  String? description;
  String? thumbnail;
  int? price;
  int? oldPrice;
  String? discountPercentage;
  int quantity;

  HiveProduct({
    this.id,
    this.name,
    this.description,
    this.thumbnail,
    this.price,
    this.oldPrice,
    this.discountPercentage,
    required this.quantity
  });

  /// keep in mind that map will be "Map<dynamic, dynamic>"
  factory HiveProduct.fromMap(Map<dynamic, dynamic> data) => HiveProduct(
        id: data['id'] as int?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        thumbnail: data['thumbnail'] as String?,
        price: data['price'] as int?,
        oldPrice: data['old_price'] as int?,
        discountPercentage: data['discount_percentage'] as String?,
        quantity: 1
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'thumbnail': thumbnail,
        'price': price,
        'old_price': oldPrice,
        'discount_percentage': discountPercentage,
        "quantity": 1
      };
}

/// Create maunally type adapter

class CartAdapter extends TypeAdapter<HiveProduct> {
  @override
  final typeId = 0;

  @override
  HiveProduct read(BinaryReader reader) {
    return HiveProduct.fromMap(reader.read());
  }

  @override
  void write(BinaryWriter writer, HiveProduct obj) {
    writer.write(obj.toMap());
  }
}
