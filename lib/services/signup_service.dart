import 'dart:convert';
import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';
import 'package:chopwell_rider_application/models/request_models/signup_request_model.dart';
import 'package:chopwell_rider_application/hooks/request_module.dart';

class SignupService {
  static const String _signupPath = '/rider/signup';

  static Future<MapDataResponseModel> signup(SignupRequestModel request) async {
    final response = await RequestModule.post(_signupPath, request.toJson(),
        headers: {"": ""});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = MapDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception('Failed to sign up user');
    }
  }
}
