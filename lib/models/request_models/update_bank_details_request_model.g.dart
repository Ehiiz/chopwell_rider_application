// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_bank_details_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBankDetailsRequestModel _$UpdateBankDetailsRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateBankDetailsRequestModel(
      account_number: json['account_number'] as String,
      account_name: json['account_name'] as String,
      bank_name: json['bank_name'] as String,
      bank_code: json['bank_code'] as String,
    );

Map<String, dynamic> _$UpdateBankDetailsRequestModelToJson(
        UpdateBankDetailsRequestModel instance) =>
    <String, dynamic>{
      'bank_name': instance.bank_name,
      'bank_code': instance.bank_code,
      'account_name': instance.account_name,
      'account_number': instance.account_number,
    };
