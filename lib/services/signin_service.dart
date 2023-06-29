import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/models/response_models/error_response_model.dart';
import 'package:chopwell_rider_application/services/complete_account_service.dart';
import 'package:chopwell_rider_application/utils/request_module.dart';
import 'package:chopwell_rider_application/models/request_models/signin_request_model.dart';
import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';
import 'package:chopwell_rider_application/models/response_models/string_based_response_model.dart';

class SigninService {
  static const String _signinPath = "/rider/login";

  static Future<MapDataResponseModel> signin(SignInRequestModel request) async {
    final headers = {"": ""};

    final response = await RequestModule.post(_signinPath, request.toJson(),
        headers: headers);

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);

      if (responseMap["status"] != "error") {
        final decodedResponse = MapDataResponseModel.fromJson(responseMap);
        return decodedResponse;
      } else {
        final decodedResponse = ErrorResponseModel.fromJson(responseMap);
        return convertErrorResponse(decodedResponse);
      }
    } else {
      final responseMap = json.decode(response.body);

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertErrorResponse(decodedResponse);
      throw Exception('Failed to sign in user');
    }
  }
}
