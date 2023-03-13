import 'dart:convert';

import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/request_models/update_bank_details_request_model.dart';
import 'package:flutter/material.dart';

import '../models/response_models/map_based_response_model.dart';
import '../screens/registration_page/loginPage.dart';

class UpdateBankDetailsService {
  static const String _updateBankPath = "/rider/update/bank-details";

  BuildContext? get context => null;

  Future<MapDataResponseModel> updateBank(
      UpdateBankDetailsRequestModel request) async {
    final token = await AuthToken.getAuthToken();

    final response = await RequestModule.patch(
        _updateBankPath, request.toJson(),
        headers: {"Authorization": "Bearer ${token!}"});
    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = MapDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception("Unable to update bank details");
    }
  }
}
