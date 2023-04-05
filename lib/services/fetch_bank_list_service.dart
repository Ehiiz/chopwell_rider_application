import 'dart:convert';

import 'package:chopwell_rider_application/models/request_models/bvn_enquiry_request_model.dart';
import 'package:chopwell_rider_application/models/response_models/error_response_model.dart';
import 'package:chopwell_rider_application/services/complete_account_service.dart';
import 'package:chopwell_rider_application/utils/request_module.dart';
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
  static const String _bvnEnquiryPath = "/payment/bvn-enquiry";

  Future<MapDataResponseModel> bankList() async {
    final response = await RequestModule.get(_bankListPath, headers: {"": ""});

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

  Future<MapDataResponseModel> nameEnquiry(
      NameEnquiryRequestModel request) async {
    final response =
        await RequestModule.post(_nameEnquiryPath, request, headers: {"": ""});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      print("I was successful");
      print(responseMap);
      if (responseMap["data"] != null) {
        final decodedResponse = MapDataResponseModel.fromJson(responseMap);
        return decodedResponse;
      }

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertErrorResponse(decodedResponse);
    } else {
      print("I was failed");
      final responseMap = json.decode(response.body);

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertErrorResponse(decodedResponse);
      // throw Exception("Unable to set up working hours");
    }
  }

  Future<MapDataResponseModel> bvnEnquiry(
      BvnEnquiryRequestModel request) async {
    final response =
        await RequestModule.post(_bvnEnquiryPath, request, headers: {"": ""});

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      print("I was successful");
      print(responseMap);
      if (responseMap["data"] != null) {
        final decodedResponse = MapDataResponseModel.fromJson(responseMap);
        return decodedResponse;
      }

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertErrorResponse(decodedResponse);
    } else {
      print("I was failed");
      final responseMap = json.decode(response.body);

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertErrorResponse(decodedResponse);
      // throw Exception("Unable to set up working hours");
    }
  }
}
