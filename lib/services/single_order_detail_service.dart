import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final singleOrderProvider =
    Provider<SingleOrderDetailService>((ref) => SingleOrderDetailService());

class SingleOrderDetailService {
  static const String _fetchOrderDetailPath = '/rider/order-info/';

  Future<MapDataResponseModel> orderDetail(String orderId) async {
    final token = await AuthToken.getAuthToken();
    String finalUrl = '$_fetchOrderDetailPath$orderId';
    final response = await RequestModule.get(finalUrl,
        headers: {"Authorization": "Bearer ${token!}"});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = MapDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception('Unable to fetch customer detail');
    }
  }
}
