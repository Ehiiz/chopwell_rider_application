import 'package:json_annotation/json_annotation.dart';

part 'set_location_request_model.g.dart';

@JsonSerializable()
class SetLocationRequestModel {
  final String location;
  final double latitude;
  final double longitude;

  SetLocationRequestModel(
      {required this.location,
      required this.latitude,
      required this.longitude});

  factory SetLocationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SetLocationRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SetLocationRequestModelToJson(this);
}
