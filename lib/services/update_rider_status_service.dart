import 'dart:convert';

import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/request_models/update_rider_status_request_model.dart';
import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';

class UpdateRiderService {
  static const String _updateRiderStatus = "/rider/status";

  Future<MapDataResponseModel> flipStatus(
      UpdateRiderStatusRequestModel request) async {
    final token = await AuthToken.getAuthToken();
    final response = await RequestModule.patch(_updateRiderStatus, request,
        headers: {"Authorization": "Bearer ${token!}"});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = MapDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw new Exception("Unable to update rider status");
    }
  }
}
