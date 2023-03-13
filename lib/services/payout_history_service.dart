import 'dart:convert';

import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/response_models/list_based_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final payoutHistoryServiceProvider = Provider<PayoutHistoryService>((ref) {
  return PayoutHistoryService();
});

class PayoutHistoryService {
  static const String _payoutHistoryPath = "/rider/payouts";

  Future<ListDataResponseModel> fetchPayouts() async {
    final token = await AuthToken.getAuthToken();
    final response = await RequestModule.get(_payoutHistoryPath,
        headers: {"Authorization": "Bearer ${token!}"});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = ListDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw new Exception("Error fetching payouts");
    }
  }
}
