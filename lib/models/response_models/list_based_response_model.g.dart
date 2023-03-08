// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_based_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListDataResponseModel _$ListDataResponseModelFromJson(
        Map<String, dynamic> json) =>
    ListDataResponseModel(
      message: json['message'] as String,
      status: json['status'] as String,
      data: json['data'] as List<dynamic>,
    );

Map<String, dynamic> _$ListDataResponseModelToJson(
        ListDataResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
