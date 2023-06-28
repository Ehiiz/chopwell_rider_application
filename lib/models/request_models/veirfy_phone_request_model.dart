import 'package:json_annotation/json_annotation.dart';

part 'verify_phone_request_model.g.dart';

@JsonSerializable()
class VerifyPhoneRequestModel {
  final String phoneNumber;

  VerifyPhoneRequestModel({required this.phoneNumber});

  factory VerifyPhoneRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyPhoneRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyPhoneRequestModelToJson(this);
}
