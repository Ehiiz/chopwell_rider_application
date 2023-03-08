// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'string_based_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StringDataResponseModel _$StringDataResponseModelFromJson(
        Map<String, dynamic> json) =>
    StringDataResponseModel(
      message: json['message'] as String,
      status: json['status'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$StringDataResponseModelToJson(
        StringDataResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
