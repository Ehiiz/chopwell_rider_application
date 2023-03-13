import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/response_models/string_based_response_model.dart';

import '../models/request_models/withdraw_wallet_request_model.dart';

class PayWalletService {
  static const String _withdrawWalletPath = '/rider/withdraw-funds';

  static Future<StringDataResponseModel> paywallet(
    WithdrawWalletRequestModel request,
  ) async {
    final token = await AuthToken.getAuthToken();
    final response = await RequestModule.post(
        _withdrawWalletPath, request.toJson(),
        headers: {"Authorization": "Bearer ${token!}"});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = StringDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception('Unable to pay with wallet');
    }
  }
}
