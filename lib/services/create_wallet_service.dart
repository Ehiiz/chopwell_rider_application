import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/response_models/string_based_response_model.dart';

class CreateWalletAccountService {
  static const String _createWalletPath = '/rider/create-wallet';

  static Future<StringDataResponseModel> createWallet() async {
    final token = await AuthToken.getAuthToken();

    final response = await RequestModule.post(_createWalletPath, {},
        headers: {"Authorization": "Bearer ${token!}"});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);

      final decodedResponse = StringDataResponseModel.fromJson(responseMap);

      return decodedResponse;
    } else {
      throw Exception('Unable to create wallet');
    }
  }
}
