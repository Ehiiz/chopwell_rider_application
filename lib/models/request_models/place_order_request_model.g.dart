// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderRequestModel _$PlaceOrderRequestModelFromJson(
        Map<String, dynamic> json) =>
    PlaceOrderRequestModel(
      restaurant_id: json['restaurant_id'] as String,
      food: (json['food'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      amount: json['amount'] as String,
      deliveryFee: json['deliveryFee'] as String,
      vat: json['vat'] as String,
      total: json['total'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['address'] as String,
    );

Map<String, dynamic> _$PlaceOrderRequestModelToJson(
        PlaceOrderRequestModel instance) =>
    <String, dynamic>{
      'restaurant_id': instance.restaurant_id,
      'food': instance.food,
      'amount': instance.amount,
      'deliveryFee': instance.deliveryFee,
      'vat': instance.vat,
      'total': instance.total,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
    };
