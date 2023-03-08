import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/request_models/create_custom_order_model.dart';
import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';

class PlaceCustomOrderService {
  static const String _placeCustomOrderPath = '/rider/custom-order';

  static Future<MapDataResponseModel> placeOrder(
      CreateCustomOrderRequestModel request) async {
    final token = await AuthToken.getAuthToken();
    final response = await RequestModule.post(
        _placeCustomOrderPath, request.toJson(),
        headers: {"Authorization": "Bearer ${token!}"});
    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = MapDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception('Unable to place order');
    }
  }
}
