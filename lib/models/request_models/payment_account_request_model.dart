import 'package:json_annotation/json_annotation.dart';

part 'payment_account_request_model.g.dart';

@JsonSerializable()
class PaymentAccountRequestModel {
  final String order_id;
  final String amount;

  PaymentAccountRequestModel({required this.order_id, required this.amount});

  factory PaymentAccountRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentAccountRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentAccountRequestModelToJson(this);
}
