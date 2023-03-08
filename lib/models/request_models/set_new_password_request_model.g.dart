// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_new_password_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetNewPasswordRequestModel _$SetNewPasswordRequestModelFromJson(
        Map<String, dynamic> json) =>
    SetNewPasswordRequestModel(
      email: json['email'] as String,
      otp: json['otp'] as String,
      new_password: json['new_password'] as String,
    );

Map<String, dynamic> _$SetNewPasswordRequestModelToJson(
        SetNewPasswordRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
      'new_password': instance.new_password,
    };
