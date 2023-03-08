import 'package:json_annotation/json_annotation.dart';

part 'add_fave_order_request_model.g.dart';

@JsonSerializable()
class AddFaveOrderRequestModel {
  final String order_id;

  AddFaveOrderRequestModel({required this.order_id});

  factory AddFaveOrderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddFaveOrderRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddFaveOrderRequestModelToJson(this);
}
