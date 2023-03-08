import 'package:json_annotation/json_annotation.dart';

part 'null_data_response_model.g.dart';

@JsonSerializable()
class NullDataResponseModel {
  final String message;
  final String status;

  NullDataResponseModel({required this.message, required this.status});

  factory NullDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NullDataResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$NullDataResponseModelToJson(this);
}
