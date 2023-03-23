// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_account_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteAccountRequestModel _$CompleteAccountRequestModelFromJson(
        Map<String, dynamic> json) =>
    CompleteAccountRequestModel(
      name: json['name'] as String,
      address: json['address'] as String,
      state: json['state'] as String,
      phone: json['phone'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$CompleteAccountRequestModelToJson(
        CompleteAccountRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'state': instance.state,
      'phone': instance.phone,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'image': instance.image,
    };
