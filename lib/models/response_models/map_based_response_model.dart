import 'package:json_annotation/json_annotation.dart';

part 'map_based_response_model.g.dart';

@JsonSerializable()
class MapDataResponseModel {
  final String message;
  final String status;
  final Map<String, dynamic> data;

  MapDataResponseModel(
      {required this.message, required this.status, required this.data});

  factory MapDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MapDataResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MapDataResponseModelToJson(this);
}
