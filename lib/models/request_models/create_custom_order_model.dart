import "package:json_annotation/json_annotation.dart";

part "create_custom_order_model.g.dart";

@JsonSerializable()
class CreateCustomOrderRequestModel {
  final String order_details;
  final String location;
  final String errand_fee;
  final String delivery_fee;
  final String amount;
  final String total;

  CreateCustomOrderRequestModel({
    required this.amount,
    required this.delivery_fee,
    required this.errand_fee,
    required this.location,
    required this.order_details,
    required this.total,
  });

  factory CreateCustomOrderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCustomOrderRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCustomOrderRequestModelToJson(this);
}
