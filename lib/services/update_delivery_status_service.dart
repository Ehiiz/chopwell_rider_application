import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/models/response_models/error_response_model.dart';
import 'package:chopwell_rider_application/services/complete_account_service.dart';
import 'package:chopwell_rider_application/utils/request_module.dart';
import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';
import 'package:chopwell_rider_application/models/request_models/set_delivery_status_request_model.dart';

class UpdateDeliveryStatus {
  UpdateDeliveryStatus(String orderId) {
    order_id = orderId;
  }
  late String order_id;

  String get setDeliveryStatusPath =>
      '/rider/order-info/${order_id}/delivery-status';

  Future<MapDataResponseModel> status(
      SetDeliveryStatusRequestModel request) async {
    final token = await AuthToken.getAuthToken();
    final response = await RequestModule.patch(
        setDeliveryStatusPath, request.toJson(),
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
      print(responseMap);

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertErrorResponse(decodedResponse);
      // throw Exception("Unable to set up working hours");
    }
  }
}
