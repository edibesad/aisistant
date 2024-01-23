import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  ResponseModel({
    this.message,
    this.result,
    this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  final String? message;
  final bool? result;
  final dynamic data;

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
