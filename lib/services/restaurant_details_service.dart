import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/response_models/list_based_response_model.dart';
import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantDetailProvider =
    Provider<RestaurantDetailService>((ref) => RestaurantDetailService());

class RestaurantDetailService {
  static const String _getRestaurantPath = '/rider/restaurant-info/';

  Future<MapDataResponseModel> restaurant(String restaurant_id) async {
    String finalUrl = '$_getRestaurantPath$restaurant_id';
    final token = await AuthToken.getAuthToken();
    final response = await RequestModule.get(finalUrl,
        headers: {"Authorization": "Bearer ${token!}"});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = MapDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception('Unable to fetch restaurant details');
    }
  }
}
