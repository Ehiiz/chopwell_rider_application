import 'package:json_annotation/json_annotation.dart';

part 'set_location_request_model.g.dart';

@JsonSerializable()
class SetLocationRequestModel {
  final String location;

  SetLocationRequestModel({required this.location});

  factory SetLocationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SetLocationRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SetLocationRequestModelToJson(this);
}
