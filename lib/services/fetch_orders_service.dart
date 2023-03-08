import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/response_models/null_list_based_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchOrdersProvider =
    Provider<FetchOrdersService>((ref) => FetchOrdersService());

class FetchOrdersService {
  static const String _fetchOrdersPath = '/rider/orders';

  Future<NullListDataResponseModel> orders() async {
    final token = await AuthToken.getAuthToken();

    final response = await RequestModule.get(_fetchOrdersPath,
        headers: {"Authorization": "Bearer ${token!}"});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = NullListDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception('Unable to fetch orders');
    }
  }
}
