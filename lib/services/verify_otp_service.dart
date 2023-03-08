import 'dart:convert';
import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';
import 'package:chopwell_rider_application/models/request_models/verify_otp_request_model.dart';

class VerifyOtpService {
  static const String _verifyOtpPath = '/rider/password-reset/otp';

  static Future<MapDataResponseModel> verifyotp(
      VerifyOtpRequestModel request) async {
    final response = await RequestModule.post(_verifyOtpPath, request.toJson(),
        headers: {"": ""});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = MapDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception('Failed to verify OTP');
    }
  }
}
