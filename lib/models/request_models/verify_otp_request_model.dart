import "package:json_annotation/json_annotation.dart";

part "verify_otp_request_model.g.dart";

@JsonSerializable()
class VerifyOtpRequestModel {
  final String otp;
  final String email;
  VerifyOtpRequestModel({required this.email, required this.otp});

  factory VerifyOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpRequestModelToJson(this);
}
