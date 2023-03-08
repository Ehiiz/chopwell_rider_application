// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_custom_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCustomOrderRequestModel _$CreateCustomOrderRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateCustomOrderRequestModel(
      amount: json['amount'] as String,
      delivery_fee: json['delivery_fee'] as String,
      errand_fee: json['errand_fee'] as String,
      location: json['location'] as String,
      order_details: json['order_details'] as String,
      total: json['total'] as String,
    );

Map<String, dynamic> _$CreateCustomOrderRequestModelToJson(
        CreateCustomOrderRequestModel instance) =>
    <String, dynamic>{
      'order_details': instance.order_details,
      'location': instance.location,
      'errand_fee': instance.errand_fee,
      'delivery_fee': instance.delivery_fee,
      'amount': instance.amount,
      'total': instance.total,
    };
