import 'dart:convert';

class Product {
  int? id;
  String? name;
  String? description;
  String? thumbnail;
  int? price;
  int? oldPrice;
  String? discountPercentage;
  int? shopId;
  String? shopName;
  String? sellType;
  int? minOrderQty;
  bool? inStock;

  Product({
    this.id,
    this.name,
    this.description,
    this.thumbnail,
    this.price,
    this.oldPrice,
    this.discountPercentage,
    this.shopId,
    this.shopName,
    this.sellType,
    this.minOrderQty,
    this.inStock,
  });

  factory Product.fromMap(Map<String, dynamic> data) => Product(
        id: data['id'] as int?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        thumbnail: data['thumbnail'] as String?,
        price: data['price'] as int?,
        oldPrice: data['old_price'] as int?,
        discountPercentage: data['discount_percentage'] as String?,
        shopId: data['shop_id'] as int?,
        shopName: data['shop_name'] as String?,
        sellType: data['sell_type'] as String?,
        minOrderQty: data['min_order_qty'] as int?,
        inStock: data['in_stock'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'thumbnail': thumbnail,
        'price': price,
        'old_price': oldPrice,
        'discount_percentage': discountPercentage,
        'shop_id': shopId,
        'shop_name': shopName,
        'sell_type': sellType,
        'min_order_qty': minOrderQty,
        'in_stock': inStock,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Product].
  factory Product.fromJson(String data) {
    return Product.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Product] to a JSON string.
  String toJson() => json.encode(toMap());
}
