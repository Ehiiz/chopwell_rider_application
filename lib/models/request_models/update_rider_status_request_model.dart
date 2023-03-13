import 'package:json_annotation/json_annotation.dart';

part 'update_rider_status_request_model.g.dart';

@JsonSerializable()
class UpdateRiderStatusRequestModel {
  final String rider_status;

  UpdateRiderStatusRequestModel({required this.rider_status});

  factory UpdateRiderStatusRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateRiderStatusRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateRiderStatusRequestModelToJson(this);
}
