// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_location_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetLocationRequestModel _$SetLocationRequestModelFromJson(
        Map<String, dynamic> json) =>
    SetLocationRequestModel(
      location: json['location'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$SetLocationRequestModelToJson(
        SetLocationRequestModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
