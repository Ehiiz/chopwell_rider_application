import 'package:json_annotation/json_annotation.dart';

part 'place_order_request_model.g.dart';

@JsonSerializable()
class PlaceOrderRequestModel {
  final String restaurant_id;
  final List<Map<String, String>> food;
  final String amount;
  final String deliveryFee;
  final String vat;
  final String total;
  final double latitude;
  final double longitude;
  final String address;

  PlaceOrderRequestModel({
    required this.restaurant_id,
    required this.food,
    required this.amount,
    required this.deliveryFee,
    required this.vat,
    required this.total,
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  factory PlaceOrderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceOrderRequestModelToJson(this);
}
