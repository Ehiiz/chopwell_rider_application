import 'package:json_annotation/json_annotation.dart';

part "signin_request_model.g.dart";

@JsonSerializable()
class SignInRequestModel {
  final String phoneNumber;
  final String password;
  final String appId;

  SignInRequestModel(
      {required this.phoneNumber, required this.password, required this.appId});

  factory SignInRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestModelToJson(this);
}
