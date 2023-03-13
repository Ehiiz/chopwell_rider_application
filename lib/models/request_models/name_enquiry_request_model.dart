import 'package:json_annotation/json_annotation.dart';

part 'name_enquiry_request_model.g.dart';

@JsonSerializable()
class NameEnquiryRequestModel {
  NameEnquiryRequestModel({
    required this.account_number,
    required this.bank_code,
  });

  String account_number;
  String bank_code;

  factory NameEnquiryRequestModel.fromJson(Map<String, dynamic> json) =>
      _$NameEnquiryRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$NameEnquiryRequestModelToJson(this);
}
