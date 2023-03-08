import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chopwell_rider_application/models/response_models/list_based_response_model.dart';

final homeDetailsProvider =
    Provider<HomeDetailsService>((ref) => HomeDetailsService());

class HomeDetailsService {
  static const String _fetchRestaurantsPath = "/rider/restaurants?name=";
  static const String _fetchProductsPath = "/rider/products";

  Future<ListDataResponseModel> restaurants() async {
    final token = await AuthToken.getAuthToken();

    final response = await RequestModule.get(_fetchRestaurantsPath,
        headers: {"Authorization": "Bearer ${token!}"});
    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = ListDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception('Unable to fetch restaurants');
    }
  }

  Future<ListDataResponseModel> products() async {
    final token = await AuthToken.getAuthToken();
    final response = await RequestModule.get(_fetchProductsPath,
        headers: {"Authorization": "Bearer ${token!}"});
    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = ListDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception('Unable to fetch products');
    }
  }
}
