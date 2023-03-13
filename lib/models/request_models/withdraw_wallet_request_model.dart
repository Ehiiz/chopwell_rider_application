import 'package:json_annotation/json_annotation.dart';

part 'withdraw_wallet_request_model.g.dart';

@JsonSerializable()
class WithdrawWalletRequestModel {
  final String pin;
  final String amount;

  WithdrawWalletRequestModel({required this.pin, required this.amount});

  factory WithdrawWalletRequestModel.fromJson(Map<String, dynamic> json) =>
      _$WithdrawWalletRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawWalletRequestModelToJson(this);
}
