import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/models/response_models/error_response_model.dart';
import 'package:chopwell_rider_application/services/complete_account_service.dart';
import 'package:chopwell_rider_application/utils/request_module.dart';
import 'package:chopwell_rider_application/models/response_models/string_based_response_model.dart';

class CreateWalletAccountService {
  static const String _createWalletPath = '/rider/create-wallet';

  static Future<StringDataResponseModel> createWallet() async {
    final token = await AuthToken.getAuthToken();

    final response = await RequestModule.post(_createWalletPath, {},
        headers: {"Authorization": "Bearer ${token!}"});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      if (responseMap["data"] != null) {
        final decodedResponse = StringDataResponseModel.fromJson(responseMap);
        return decodedResponse;
      }

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertStringErrorResponse(decodedResponse);
    } else {
      final responseMap = json.decode(response.body);

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertStringErrorResponse(decodedResponse);
      // throw Exception("Unable to set up working hours");
    }
  }
}
