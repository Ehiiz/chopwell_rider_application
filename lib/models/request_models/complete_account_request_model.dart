import 'package:json_annotation/json_annotation.dart';

part 'complete_account_request_model.g.dart';

@JsonSerializable()
class CompleteAccountRequestModel {
  final String name;
  final String address;
  final String state;
  final String phone;
  final double latitude;
  final double longitude;
  final String profile_picture;

  CompleteAccountRequestModel({
    required this.name,
    required this.address,
    required this.state,
    required this.phone,
    required this.latitude,
    required this.longitude,
    required this.profile_picture,
  });

  factory CompleteAccountRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CompleteAccountRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteAccountRequestModelToJson(this);
}
