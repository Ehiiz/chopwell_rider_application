import 'package:chopwell_rider_application/models/asset_models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantDetailsStateNotifierProvider =
    StateNotifierProvider<RestaurantDetailsStateNotifier, List<Product>>(
        (ref) => RestaurantDetailsStateNotifier());

class RestaurantDetailsStateNotifier extends StateNotifier<List<Product>> {
  RestaurantDetailsStateNotifier() : super([]);

  void updateProduct(List<Product> products) {
    state = [...products];
  }
}
