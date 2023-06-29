import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/models/response_models/error_response_model.dart';
import 'package:chopwell_rider_application/services/complete_account_service.dart';
import 'package:chopwell_rider_application/utils/request_module.dart';
import 'package:chopwell_rider_application/models/response_models/string_based_response_model.dart';

import '../models/request_models/withdraw_wallet_request_model.dart';
import '../models/response_models/null_data_response_model.dart';

class PayWalletService {
  static const String _withdrawWalletPath = '/rider/withdraw-funds';

  static Future<NullDataResponseModel> paywallet(
    WithdrawWalletRequestModel request,
  ) async {
    final token = await AuthToken.getAuthToken();
    final response = await RequestModule.post(
        _withdrawWalletPath, request.toJson(),
        headers: {"Authorization": "Bearer ${token!}"});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      if (responseMap["message"] != "jwt expired") {
        final decodedResponse = NullDataResponseModel.fromJson(responseMap);
        return decodedResponse;
      }

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertNullErrorResponse(decodedResponse);
    } else {
      final responseMap = json.decode(response.body);

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertNullErrorResponse(decodedResponse);
      // throw Exception("Unable to set up working hours");
    }
  }
}
