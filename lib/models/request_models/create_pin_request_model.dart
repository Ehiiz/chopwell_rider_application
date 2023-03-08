import "package:json_annotation/json_annotation.dart";

part "create_pin_request_model.g.dart";

@JsonSerializable()
class CreatePinRequestModel {
  final String pin;

  CreatePinRequestModel({required this.pin});

  factory CreatePinRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePinRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePinRequestModelToJson(this);
}
