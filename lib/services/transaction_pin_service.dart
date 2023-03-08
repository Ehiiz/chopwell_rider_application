import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/request_models/change_pin_request_model.dart';
import 'package:chopwell_rider_application/models/request_models/create_pin_request_model.dart';
import 'package:chopwell_rider_application/models/response_models/string_based_response_model.dart';

import '../models/response_models/null_data_response_model.dart';

class PinService {
  static const String _pinservice = '/rider/setup/transaction-pin';

  static Future<NullDataResponseModel> createNewPin(
      CreatePinRequestModel request) async {
    final token = await AuthToken.getAuthToken();

    final response = await RequestModule.post(_pinservice, request.toJson(),
        headers: {"Authorization": "Bearer ${token!}"});

    print(response);

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      print(responseMap);
      final decodedResponse = NullDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception('Unable to set pin');
    }
  }

  static Future<NullDataResponseModel> changePin(
      ChangePinRequestModel request) async {
    final token = await AuthToken.getAuthToken();

    final response = await RequestModule.patch(_pinservice, request.toJson(),
        headers: {"Authorization": "Bearer ${token!}"});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);

      final decodedResponse = NullDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception('Unable to set pin');
    }
  }
}
