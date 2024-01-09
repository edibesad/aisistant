import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../abstracts/network_service.dart';
import '../../models/response_model.dart';

class DioManager extends NetworkService {
  static Dio? _dio;
  static const String _baseUrl = 'http://10.0.2.2:8080/';

  static Dio get dio {
    _dio ??= Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        headers: {
          "api-key":
              "fa56314937726b28e53c57988c05adefe71b507202302c37f5e14836e9a0ed0c"
        },
        contentType: Headers.jsonContentType,
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 3000),
      ),
    )..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {
          return handler.next(options);
        },
        onError: (DioException err, handler) async {
          return handler.next(err);
        },
      ));
    return _dio!;
  }

  @override
  Future<ResponseModel> deleteRequest(String path,
      {Map<String, dynamic>? params}) async {
    try {
      final response = await dio.delete(path, queryParameters: params);
      return ResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      return ResponseModel(
        result: false,
        message: e.response.toString(),
      );
    }
  }

  @override
  Future<ResponseModel> getRequest(String path,
      {Map<String, dynamic>? params}) async {
    try {
      final response = await dio.get(path, queryParameters: params);
      return ResponseModel.fromJson(response.data);
    } catch (e) {
      return ResponseModel(
        result: false,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ResponseModel> postRequest(String path,
      {Map<String, dynamic>? params, Map<String, dynamic>? data}) async {
    try {
      final response =
          await dio.post(path, queryParameters: params, data: data);
      return ResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if (kDebugMode) {
        log(e.response.toString());
      }
      if (e.response != null) {
        return ResponseModel.fromJson(e.response!.data);
      }
      return ResponseModel(
        result: false,
        message: e.toString(),
      );
    } catch (e) {
      return ResponseModel(
        result: false,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ResponseModel> putRequest(String path,
      {Map<String, dynamic>? params, Map<String, dynamic>? data}) async {
    try {
      final response =
          await dio.post(path, queryParameters: params, data: data);
      return ResponseModel.fromJson(response.data);
    } catch (e) {
      return ResponseModel(
        result: false,
        message: e.toString(),
      );
    }
  }
}
