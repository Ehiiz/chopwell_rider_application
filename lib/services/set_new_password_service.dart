import 'dart:convert';

import 'package:chopwell_rider_application/models/response_models/error_response_model.dart';
import 'package:chopwell_rider_application/services/complete_account_service.dart';
import 'package:chopwell_rider_application/utils/request_module.dart';
import 'package:chopwell_rider_application/models/response_models/null_data_response_model.dart';
import 'package:chopwell_rider_application/models/request_models/set_new_password_request_model.dart';

class SetNewPasswordService {
  static const String _setNewPasswordPath =
      '/rider/password-reset/new-password';

  static Future<NullDataResponseModel> setNewPassword(
      SetNewPasswordRequestModel request) async {
    final headers = {"": ""};
    final response = await RequestModule.patch(
        _setNewPasswordPath, request.toJson(),
        headers: headers);

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      if (responseMap["message"] != "jwt expired") {
        final decodedResponse = NullDataResponseModel.fromJson(responseMap);
        return decodedResponse;
      }

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertNullErrorResponse(decodedResponse);
    } else {
      final responseMap = json.decode(response.body);

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertNullErrorResponse(decodedResponse);
      // throw Exception("Unable to set up working hours");
    }
  }
}
