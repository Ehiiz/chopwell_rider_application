import 'dart:convert';
import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/request_models/verify_email_request_model.dart';
import 'package:chopwell_rider_application/models/response_models/string_based_response_model.dart';

class PasswordResetEmailService {
  static const String _passwordResetPath = '/rider/password-reset/email';

  static Future<StringDataResponseModel> passwordReset(
      VerifyEmailRequestModel request) async {
    final response = await RequestModule.post(
        _passwordResetPath, request.toJson(),
        headers: {"": ""});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = StringDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception('Unable verify email');
    }
  }
}
