import "package:json_annotation/json_annotation.dart";

part "change_pin_request_model.g.dart";

@JsonSerializable()
class ChangePinRequestModel {
  final String old_pin;
  final String new_pin;

  ChangePinRequestModel({required this.old_pin, required this.new_pin});

  factory ChangePinRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePinRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePinRequestModelToJson(this);
}
