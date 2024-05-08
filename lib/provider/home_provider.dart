import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_cart/models/all_products_list_model/all_products_list_model.dart';
import 'package:hive_cart/service/product_service.dart';
import '../models/all_products_list_model/product.dart';

class HomeProvider extends StateNotifier<AsyncValue<AllProductsListModel>> {
  final Ref ref;
  HomeProvider({required this.ref}) : super(AsyncLoading()) {
    getAllHomeProducts();
  }

  Future<void> getAllHomeProducts() async {
    try {
      final response =
          await ref.read(allProductsServiceProvider).getAllProducts();
      debugPrint("all response${response}");
      debugPrint("all response data${response.data["data"]}");
      final data = AllProductsListModel.fromMap(response.data);
      debugPrint("all data${data.data?.products}");
      state = AsyncData(data);
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      state = AsyncError(e, stackTrace);
      throw stackTrace;
    }
  }
}

final homeProductProvider =
    StateNotifierProvider<HomeProvider, AsyncValue<AllProductsListModel>>(
        (ref) {
  return HomeProvider(ref: ref);
});
