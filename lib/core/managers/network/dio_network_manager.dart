import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

import '../../app/models/response_model.dart';
import '../../repository/network_repository.dart';

class DioManager extends NetworkRepository {
  static Dio? _dio;

  static Dio get dio {
    _dio ??= Dio(
      BaseOptions(
        headers: <String, dynamic>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        contentType: Headers.jsonContentType,
        connectTimeout: const Duration(seconds: 200),
        receiveTimeout: const Duration(seconds: 200),
        validateStatus: (status) => status! < 500,
      ),
    )..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            return handler.next(options);
          },
          onError: (err, handler) async {
            return handler.next(err);
          },
        ),
      );
    return _dio!;
  }

  @override
  Future<ResponseModel> deleteRequest(
    String path, {
    Map<String, dynamic>? params,
  }) async {
    try {
      final Response<Map<String, dynamic>> response =
          await dio.delete(path, queryParameters: params);

      if (kDebugMode) {
        log(response.data.toString());
      }

      return ResponseModel(
        result: true,
        data: response.data,
        message: 'success'.tr(),
      );
    } on DioException catch (e) {
      return ResponseModel(
        result: false,
        message: e.response.toString(),
      );
    } catch (e) {
      return ResponseModel(
        result: false,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ResponseModel> getRequest(
    String path, {
    Map<String, dynamic>? params,
  }) async {
    try {
      final Response<Map<String, dynamic>> response =
          await dio.get(path, queryParameters: params);

      if (kDebugMode) {
        log(response.data.toString());
      }

      return ResponseModel(
        result: true,
        data: response.data,
        message: 'success'.tr(),
      );
    } on DioException catch (e) {
      if (e.response is Map<String, dynamic>) {
        return ResponseModel.fromJson(e.response!.data as Map<String, dynamic>);
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
  Future<ResponseModel> postRequest(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? data,
  }) async {
    try {
      final Response<Map<String, dynamic>> response =
          await dio.post(path, queryParameters: params, data: data);

      if (kDebugMode) {
        log(response.data.toString());
      }

      return ResponseModel(
        result: true,
        data: response.data,
        message: 'success'.tr(),
      );
    } on DioException catch (e) {
      if (e.response is Map<String, dynamic>) {
        return ResponseModel.fromJson(e.response! as Map<String, dynamic>);
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
  Future<ResponseModel> putRequest(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? data,
  }) async {
    try {
      final Response<Map<String, dynamic>> response =
          await dio.post(path, queryParameters: params, data: data);

      if (kDebugMode) {
        log(response.data.toString());
      }

      return ResponseModel(
        result: true,
        data: response.data,
        message: 'success'.tr(),
      );
    } catch (e) {
      return ResponseModel(
        result: false,
        message: e.toString(),
      );
    }
  }
}
