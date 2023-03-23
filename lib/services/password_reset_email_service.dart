import 'dart:convert';
import 'package:chopwell_rider_application/models/response_models/error_response_model.dart';
import 'package:chopwell_rider_application/utils/request_module.dart';
import 'package:chopwell_rider_application/models/request_models/verify_email_request_model.dart';
import 'package:chopwell_rider_application/models/response_models/string_based_response_model.dart';

import 'complete_account_service.dart';

class PasswordResetEmailService {
  static const String _passwordResetPath = '/rider/password-reset/email';

  static Future<StringDataResponseModel> passwordReset(
      VerifyEmailRequestModel request) async {
    final response = await RequestModule.post(
        _passwordResetPath, request.toJson(),
        headers: {"": ""});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      if (responseMap["data"] != null) {
        final decodedResponse = StringDataResponseModel.fromJson(responseMap);
        return decodedResponse;
      }

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertStringErrorResponse(decodedResponse);
    } else {
      final responseMap = json.decode(response.body);

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertStringErrorResponse(decodedResponse);
      // throw Exception("Unable to set up working hours");
    }
  }
}
