import 'package:json_annotation/json_annotation.dart';

part 'string_based_response_model.g.dart';

@JsonSerializable()
class StringDataResponseModel {
  final String message;
  final String status;
  final String data;

  StringDataResponseModel(
      {required this.message, required this.status, required this.data});

  factory StringDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StringDataResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$StringDataResponseModelToJson(this);
}
