import 'dart:convert';

import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/response_models/null_data_response_model.dart';
import 'package:chopwell_rider_application/models/request_models/set_new_password_request_model.dart';

class SetNewPasswordService {
  static const String _setNewPasswordPath =
      '/rider/password-reset/new-password';

  static Future<NullDataResponseModel> setNewPassword(
      SetNewPasswordRequestModel request) async {
    final headers = {"": ""};
    final response = await RequestModule.post(
        _setNewPasswordPath, request.toJson(),
        headers: headers);

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = NullDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception('Unable to set new password');
    }
  }
}
