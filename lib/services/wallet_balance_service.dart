import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/models/response_models/error_response_model.dart';
import 'package:chopwell_rider_application/services/complete_account_service.dart';
import 'package:chopwell_rider_application/utils/request_module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:chopwell_rider_application/models/response_models/map_based_response_model.dart";

import '../models/response_models/string_based_response_model.dart';

final walletBalanceProvider = Provider<WalletBalance>((ref) => WalletBalance());

class WalletBalance {
  static const String _getWalletBalancePath = '/rider/wallet-balance';

  Future<MapDataResponseModel> fetchBalance() async {
    final token = await AuthToken.getAuthToken();

    final response = await RequestModule.get(_getWalletBalancePath,
        headers: {"Authorization": "Bearer ${token!}"});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      if (responseMap["data"] != null) {
        final decodedResponse = MapDataResponseModel.fromJson(responseMap);
        return decodedResponse;
      }

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertErrorResponse(decodedResponse);
    } else {
      final responseMap = json.decode(response.body);

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertErrorResponse(decodedResponse);
      // throw Exception("Unable to set up working hours");
    }
  }
}
