import "package:json_annotation/json_annotation.dart";

part 'set_new_password_request_model.g.dart';

@JsonSerializable()
class SetNewPasswordRequestModel {
  final String email;
  final String otp;
  final String new_password;

  SetNewPasswordRequestModel(
      {required this.email, required this.otp, required this.new_password});

  factory SetNewPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SetNewPasswordRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SetNewPasswordRequestModelToJson(this);
}
