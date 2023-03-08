// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'null_list_based_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NullListDataResponseModel _$NullListDataResponseModelFromJson(
        Map<String, dynamic> json) =>
    NullListDataResponseModel(
      status: json['status'] as String,
      data: json['data'] as List<dynamic>,
    );

Map<String, dynamic> _$NullListDataResponseModelToJson(
        NullListDataResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
