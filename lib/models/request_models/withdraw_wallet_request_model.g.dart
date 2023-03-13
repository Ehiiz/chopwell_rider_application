// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_wallet_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawWalletRequestModel _$WithdrawWalletRequestModelFromJson(
        Map<String, dynamic> json) =>
    WithdrawWalletRequestModel(
      pin: json['pin'] as String,
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$WithdrawWalletRequestModelToJson(
        WithdrawWalletRequestModel instance) =>
    <String, dynamic>{
      'pin': instance.pin,
      'amount': instance.amount,
    };
