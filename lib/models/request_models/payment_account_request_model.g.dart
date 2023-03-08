// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_account_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentAccountRequestModel _$PaymentAccountRequestModelFromJson(
        Map<String, dynamic> json) =>
    PaymentAccountRequestModel(
      order_id: json['order_id'] as String,
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$PaymentAccountRequestModelToJson(
        PaymentAccountRequestModel instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
      'amount': instance.amount,
    };
