import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/models/response_models/error_response_model.dart';
import 'package:chopwell_rider_application/services/complete_account_service.dart';
import 'package:chopwell_rider_application/utils/request_module.dart';
import 'package:chopwell_rider_application/models/response_models/list_based_response_model.dart';
import 'package:chopwell_rider_application/models/response_models/null_list_based_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchOrdersProvider =
    Provider<FetchOrdersService>((ref) => FetchOrdersService());

class FetchOrdersService {
  static const String _fetchOrdersPath = '/rider/orders';

  Future<ListDataResponseModel> orders() async {
    final token = await AuthToken.getAuthToken();

    final response = await RequestModule.get(_fetchOrdersPath,
        headers: {"Authorization": "Bearer ${token!}"});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      if (responseMap["data"] != null) {
        final decodedResponse = ListDataResponseModel.fromJson(responseMap);
        return decodedResponse;
      }

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertListErrorResponse(decodedResponse);
    } else {
      final responseMap = json.decode(response.body);

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertListErrorResponse(decodedResponse);
      // throw Exception("Unable to set up working hours");
    }
  }
}
