import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/request_models/complete_account_request_model.dart';
import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';

class CompleteAccountService {
  static const String _completeAccountPath = '/rider/setup/complete-setup';

  static Future<MapDataResponseModel> setup(
      CompleteAccountRequestModel request) async {
    final token = await AuthToken.getAuthToken();
    final response = await RequestModule.post(
        _completeAccountPath, request.toJson(),
        headers: {"Authorization": "Bearer ${token!}"});
    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = MapDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception('Unable to complete account setup');
    }
  }
}
