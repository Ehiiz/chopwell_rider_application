import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantID {
  void setId(String id) {
    final valueStateProvider = StateProvider<String>((ref) => id);
  }
}
