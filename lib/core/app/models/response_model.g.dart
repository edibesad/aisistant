// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) =>
    ResponseModel(
      message: json['message'] as String?,
      result: json['result'] as bool?,
      data: json['data'],
    );

// ignore: unused_element
abstract class _$ResponseModelPerFieldToJson {
  // ignore: unused_element
  static Object? message(String? instance) => instance;
  // ignore: unused_element
  static Object? result(bool? instance) => instance;
  // ignore: unused_element
  static Object? data(dynamic instance) => instance;
}

Map<String, dynamic> _$ResponseModelToJson(ResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'data': instance.data,
    };
