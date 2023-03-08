import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/hooks/request_module.dart';
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

    print(response);
    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      print(responseMap);
      final decodedResponse = MapDataResponseModel.fromJson(responseMap);
      print(decodedResponse);
      return decodedResponse;
    } else {
      throw Exception('Unable to fetch wallet balance');
    }
  }
}
