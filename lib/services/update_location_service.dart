import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/response_models/string_based_response_model.dart';
import 'package:chopwell_rider_application/models/request_models/set_location_request_model.dart';

class UpdateLocationService {
  static const String _setLocationPath = '/rider/update-location';

  static Future<StringDataResponseModel> location(
      SetLocationRequestModel request) async {
    final token = await AuthToken.getAuthToken();

    final response = await RequestModule.post(
        _setLocationPath, request.toJson(),
        headers: {"Authorization": "Bearer ${token!}"});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = StringDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception('Unable to update location');
    }
  }
}
