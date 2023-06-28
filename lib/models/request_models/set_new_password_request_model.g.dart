// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_new_password_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetNewPasswordRequestModel _$SetNewPasswordRequestModelFromJson(
        Map<String, dynamic> json) =>
    SetNewPasswordRequestModel(
      phoneNumber: json['phoneNumber'] as String,
      otp: json['otp'] as String,
      new_password: json['new_password'] as String,
    );

Map<String, dynamic> _$SetNewPasswordRequestModelToJson(
        SetNewPasswordRequestModel instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'otp': instance.otp,
      'new_password': instance.new_password,
    };
