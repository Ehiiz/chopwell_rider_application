import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/response_models/list_based_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantSearchProvider =
    Provider<RestaurantSearchService>((ref) => RestaurantSearchService());

class RestaurantSearchService {
  static String _getRestaurantSearchPath = '/rider/restaurants?name=';

  Future<ListDataResponseModel> restaurant(String name) async {
    final token = await AuthToken.getAuthToken();

    String finalUrl = '$_getRestaurantSearchPath$name';

    final response = await RequestModule.get(finalUrl,
        headers: {"Authorization": "Bearer ${token!}"});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = ListDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception('Unable to fetch restaurant details');
    }
  }
}
