import 'package:json_annotation/json_annotation.dart';

part 'list_based_response_model.g.dart';

@JsonSerializable()
class ListDataResponseModel {
  final String message;
  final String status;
  final List<dynamic> data;

  ListDataResponseModel(
      {required this.message, required this.status, required this.data});

  factory ListDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ListDataResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListDataResponseModelToJson(this);
}
