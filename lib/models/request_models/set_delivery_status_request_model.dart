import 'package:json_annotation/json_annotation.dart';

part 'set_delivery_status_request_model.g.dart';

@JsonSerializable()
class SetDeliveryStatusRequestModel {
  final String order_status;

  SetDeliveryStatusRequestModel({required this.order_status});

  factory SetDeliveryStatusRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SetDeliveryStatusRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SetDeliveryStatusRequestModelToJson(this);
}
