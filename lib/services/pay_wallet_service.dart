import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/request_models/pay_wallet_request_model.dart';
import 'package:chopwell_rider_application/models/response_models/string_based_response_model.dart';

class PayWalletService {
  static const String _payWalletPath = '/rider/pay-wallet';

  static Future<StringDataResponseModel> paywallet(
    PayWalletRequestModel request,
  ) async {
    print("I enter inside");
    final token = await AuthToken.getAuthToken();
    final response = await RequestModule.post(_payWalletPath, request.toJson(),
        headers: {"Authorization": "Bearer ${token!}"});
    print(response);

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = StringDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception('Unable to pay with wallet');
    }
  }
}
