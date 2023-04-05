import 'package:json_annotation/json_annotation.dart';

part 'bvn_enquiry_request_model.g.dart';

@JsonSerializable()
class BvnEnquiryRequestModel {
  BvnEnquiryRequestModel({
    required this.bvn,
  });

  String bvn;

  factory BvnEnquiryRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BvnEnquiryRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$BvnEnquiryRequestModelToJson(this);
}
