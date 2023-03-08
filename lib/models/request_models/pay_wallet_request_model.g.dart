// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_wallet_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayWalletRequestModel _$PayWalletRequestModelFromJson(
        Map<String, dynamic> json) =>
    PayWalletRequestModel(
      pin: json['pin'] as String,
      amount: json['amount'] as String,
      order_id: json['order_id'] as String,
    );

Map<String, dynamic> _$PayWalletRequestModelToJson(
        PayWalletRequestModel instance) =>
    <String, dynamic>{
      'pin': instance.pin,
      'amount': instance.amount,
      'order_id': instance.order_id,
    };
