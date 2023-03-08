// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_delivery_status_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetDeliveryStatusRequestModel _$SetDeliveryStatusRequestModelFromJson(
        Map<String, dynamic> json) =>
    SetDeliveryStatusRequestModel(
      order_id: json['order_id'] as String,
      order_status: json['order_status'] as String,
    );

Map<String, dynamic> _$SetDeliveryStatusRequestModelToJson(
        SetDeliveryStatusRequestModel instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
      'order_status': instance.order_status,
    };
