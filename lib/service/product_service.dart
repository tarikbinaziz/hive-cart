import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_cart/utils/api_client.dart';

abstract class AllProducts {
  Future<Response> getAllProducts();
}

class AllProductsService extends AllProducts {
  final Ref ref;

  AllProductsService({required this.ref});
  @override
  Future<Response> getAllProducts() async {
    final response = await ref.read(apiClientProvider).get(
          "https://alicom.razinsoft.com/api/product/list",
        );
    return response;
  }
}

final allProductsServiceProvider =
    Provider((ref) => AllProductsService(ref: ref));
