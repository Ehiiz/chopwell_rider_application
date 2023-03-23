import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/models/response_models/error_response_model.dart';
import 'package:chopwell_rider_application/services/complete_account_service.dart';
import 'package:chopwell_rider_application/utils/request_module.dart';
import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chopwell_rider_application/models/response_models/list_based_response_model.dart';

final homeDetailsProvider =
    Provider<HomeDetailsService>((ref) => HomeDetailsService());

class HomeDetailsService {
  static const String _fetchOrderSummaryPath = "/rider/rider-summary";
  static const String _fetchTopProductsPath = "/rider/top-products";

  Future<MapDataResponseModel> summary() async {
    final token = await AuthToken.getAuthToken();

    final response = await RequestModule.get(_fetchOrderSummaryPath,
        headers: {"Authorization": "Bearer ${token!}"});
    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      if (responseMap["data"] != null) {
        final decodedResponse = MapDataResponseModel.fromJson(responseMap);
        return decodedResponse;
      }

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertErrorResponse(decodedResponse);
    } else {
      final responseMap = json.decode(response.body);

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertErrorResponse(decodedResponse);
      // throw Exception("Unable to set up working hours");
    }
  }

  Future<ListDataResponseModel> products() async {
    final token = await AuthToken.getAuthToken();
    final response = await RequestModule.get(_fetchTopProductsPath,
        headers: {"Authorization": "Bearer ${token!}"});
    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      if (responseMap["data"] != null) {
        final decodedResponse = ListDataResponseModel.fromJson(responseMap);
        return decodedResponse;
      }

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertListErrorResponse(decodedResponse);
    } else {
      final responseMap = json.decode(response.body);

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertListErrorResponse(decodedResponse);
      // throw Exception("Unable to set up working hours");
    }
  }
}
