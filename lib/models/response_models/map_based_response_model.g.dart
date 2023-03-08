// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_based_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapDataResponseModel _$MapDataResponseModelFromJson(
        Map<String, dynamic> json) =>
    MapDataResponseModel(
      message: json['message'] as String,
      status: json['status'] as String,
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$MapDataResponseModelToJson(
        MapDataResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
