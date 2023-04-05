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
  final String dateOfBirth;
  final String bvn;

  CompleteAccountRequestModel({
    required this.name,
    required this.address,
    required this.state,
    required this.phone,
    required this.latitude,
    required this.longitude,
    required this.profile_picture,
    required this.dateOfBirth,
    required this.bvn,
  });

  factory CompleteAccountRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CompleteAccountRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteAccountRequestModelToJson(this);
}
