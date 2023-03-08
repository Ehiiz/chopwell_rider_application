// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_pin_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePinRequestModel _$ChangePinRequestModelFromJson(
        Map<String, dynamic> json) =>
    ChangePinRequestModel(
      old_pin: json['old_pin'] as String,
      new_pin: json['new_pin'] as String,
    );

Map<String, dynamic> _$ChangePinRequestModelToJson(
        ChangePinRequestModel instance) =>
    <String, dynamic>{
      'old_pin': instance.old_pin,
      'new_pin': instance.new_pin,
    };
