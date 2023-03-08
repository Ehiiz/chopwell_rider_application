import 'package:json_annotation/json_annotation.dart';

part 'null_list_based_response_model.g.dart';

@JsonSerializable()
class NullListDataResponseModel {
  final String status;
  final List<dynamic> data;

  NullListDataResponseModel({required this.status, required this.data});

  factory NullListDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NullListDataResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$NullListDataResponseModelToJson(this);
}
