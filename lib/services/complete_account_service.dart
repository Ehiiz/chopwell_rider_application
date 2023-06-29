import 'dart:convert';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/models/response_models/error_response_model.dart';
import 'package:chopwell_rider_application/models/response_models/list_based_response_model.dart';
import 'package:chopwell_rider_application/models/response_models/null_data_response_model.dart';
import 'package:chopwell_rider_application/models/response_models/string_based_response_model.dart';
import 'package:chopwell_rider_application/utils/request_module.dart';
import 'package:chopwell_rider_application/models/request_models/complete_account_request_model.dart';
import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';

MapDataResponseModel convertErrorResponse(ErrorResponseModel error) {
  // convert the error response to a valid response
  // this can be as simple or as complex as needed

  return MapDataResponseModel(
    status: "error",
    message: error.message,
    data: {},
  );
}

StringDataResponseModel convertStringErrorResponse(ErrorResponseModel error) {
  // convert the error response to a valid response
  // this can be as simple or as complex as needed

  return StringDataResponseModel(
    status: "error",
    message: error.message,
    data: "",
  );
}

ListDataResponseModel convertListErrorResponse(ErrorResponseModel error) {
  // convert the error response to a valid response
  // this can be as simple or as complex as needed

  return ListDataResponseModel(
    status: "error",
    message: error.message,
    data: [],
  );
}

NullDataResponseModel convertNullErrorResponse(ErrorResponseModel error) {
  // convert the error response to a valid response
  // this can be as simple or as complex as needed

  return NullDataResponseModel(
    status: "error",
    message: error.message,
  );
}

class CompleteAccountService {
  static const String _completeAccountPath = '/rider/setup/complete-setup';

  static Future<MapDataResponseModel> setup(
      CompleteAccountRequestModel request) async {
    final response = await RequestModule.post(
        _completeAccountPath, request.toJson(),
        headers: {"": ""});
    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      print(responseMap);
      if (responseMap["data"] != null) {
        final decodedResponse = MapDataResponseModel.fromJson(responseMap);
        await AuthToken.setAuthToken(decodedResponse.data["token"]);
        return decodedResponse;
      }

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertErrorResponse(decodedResponse);
    } else {
      final responseMap = json.decode(response.body);
      print(responseMap);

      final decodedResponse = ErrorResponseModel.fromJson(responseMap);
      return convertErrorResponse(decodedResponse);
      // throw Exception("Unable to set up working hours");
    }
  }
}
