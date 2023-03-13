// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_enquiry_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NameEnquiryRequestModel _$NameEnquiryRequestModelFromJson(
        Map<String, dynamic> json) =>
    NameEnquiryRequestModel(
      account_number: json['account_number'] as String,
      bank_code: json['bank_code'] as String,
    );

Map<String, dynamic> _$NameEnquiryRequestModelToJson(
        NameEnquiryRequestModel instance) =>
    <String, dynamic>{
      'account_number': instance.account_number,
      'bank_code': instance.bank_code,
    };
