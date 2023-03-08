import 'package:json_annotation/json_annotation.dart';

part 'pay_wallet_request_model.g.dart';

@JsonSerializable()
class PayWalletRequestModel {
  final String pin;
  final String amount;
  final String order_id;

  PayWalletRequestModel(
      {required this.pin, required this.amount, required this.order_id});

  factory PayWalletRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PayWalletRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayWalletRequestModelToJson(this);
}
