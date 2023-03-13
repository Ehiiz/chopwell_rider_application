import 'dart:convert';

import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/response_models/list_based_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deliveryHistoryProvider =
    Provider<DeliveryHistoryService>((ref) => DeliveryHistoryService());

class DeliveryHistoryService {
  static const String _fetchDeliveryHistory = "/rider/delivery-history";

  Future<ListDataResponseModel> history() async {
    final token = await AuthToken.getAuthToken();
    final response = await RequestModule.get(_fetchDeliveryHistory,
        headers: {"Authorization": "Bearer ${token!} "});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = await ListDataResponseModel.fromJson(responseMap);

      return decodedResponse;
    } else {
      throw Exception('Unable to fetch orders');
    }
  }
}
