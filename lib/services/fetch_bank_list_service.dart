import 'dart:convert';

import 'package:chopwell_rider_application/hooks/request_module.dart';
import 'package:chopwell_rider_application/models/request_models/name_enquiry_request_model.dart';
import 'package:chopwell_rider_application/models/response_models/list_based_response_model.dart';
import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bankListServiceProvider = Provider<BankEnquiryService>((ref) {
  return BankEnquiryService();
});

class BankEnquiryService {
  static const String _bankListPath = "/payment/bank-list";
  static const String _nameEnquiryPath = "/payment/name-enquiry";

  Future<MapDataResponseModel> bankList() async {
    final response = await RequestModule.get(_bankListPath, headers: {"": ""});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = MapDataResponseModel.fromJson(responseMap);

      return decodedResponse;
    } else {
      throw Exception("Error fetching bank list");
    }
  }

  Future<MapDataResponseModel> nameEnquiry(
      NameEnquiryRequestModel request) async {
    final response =
        await RequestModule.post(_nameEnquiryPath, request, headers: {"": ""});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final decodedResponse = MapDataResponseModel.fromJson(responseMap);
      return decodedResponse;
    } else {
      throw Exception("Error fetching bank list");
    }
  }
}
