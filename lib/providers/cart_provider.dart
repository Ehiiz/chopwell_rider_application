import 'package:chopwell_rider_application/models/asset_models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartStateNotifierProvider =
    StateNotifierProvider<CartStateNotifier, List<Product>>(
        (ref) => CartStateNotifier());

class CartStateNotifier extends StateNotifier<List<Product>> {
  CartStateNotifier() : super([]);

  void addProduct(Product product) {
    final index = state.indexWhere((p) => p.id == product.id);

    if (index != -1) {
      final updatedProduct = Product(
        id: product.id,
        name: product.name,
        price: product.price,
        quantity: (int.tryParse(state[index].quantity)! + 1).toString(),
        sumAmount: (int.tryParse(state[index].price)! +
                int.tryParse(state[index].sumAmount)!)
            .toString(),
        image: product.image,
        restaurantId: product.restaurantId,
      );
      final List<Product> newState = List.from(state);
      newState.removeAt(index);
      newState.insert(index, updatedProduct);

      state = newState;
    } else {
      final updatedProduct = Product(
        id: product.id,
        name: product.name,
        price: product.price,
        sumAmount: (int.tryParse(product.price)!).toString(),
        image: product.image,
        restaurantId: product.restaurantId,
      );
      state = [...state, updatedProduct];
    }
  }

  void removeProduct(Product product) {
    final index = state.indexWhere((p) => p.id == product.id);
    //logic to end process if there is no match
    if (index != -1) {
      if (int.tryParse(state[index].quantity) == 1) {
        final List<Product> newState = List.from(state);
        newState.removeAt(index);
        state = newState;
      } else {
        final updatedProduct = Product(
          id: product.id,
          name: product.name,
          price: product.price,
          quantity: (int.tryParse(state[index].quantity)! - 1).toString(),
          sumAmount: (int.tryParse(state[index].sumAmount)! -
                  int.tryParse(state[index].price)!)
              .toString(),
          image: product.image,
          restaurantId: product.restaurantId,
        );
        final List<Product> newState = List.from(state);
        newState.removeAt(index);
        newState.insert(index, updatedProduct);
        state = newState;
      }
    }
  }

  void clearCart() {
    state = [];
  }

  int getTotalPrice() {
    if (state.isEmpty) {
      return 0;
    } else {
      int totalPrice = 0;
      for (Product product in state) {
        int price = int.tryParse(product.sumAmount) ?? 0;
        totalPrice += price;
      }
      return totalPrice;
    }
  }
}
