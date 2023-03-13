import 'package:json_annotation/json_annotation.dart';

part 'update_bank_details_request_model.g.dart';

@JsonSerializable()
class UpdateBankDetailsRequestModel {
  String bank_name;
  String bank_code;
  String account_name;
  String account_number;

  UpdateBankDetailsRequestModel({
    required this.account_number,
    required this.account_name,
    required this.bank_name,
    required this.bank_code,
  });

  factory UpdateBankDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateBankDetailsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateBankDetailsRequestModelToJson(this);
}
