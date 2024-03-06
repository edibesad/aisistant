import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../app/models/response_model.dart';
import '../../constants/app_constants.dart';
import '../../repository/network_repository.dart';

class DioManager extends NetworkRepository {
  Dio? _dio;

  Dio get dio {
    _dio ??= Dio(
      BaseOptions(
        baseUrl: AppConstants.API_URL,
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
  Future<ResponseModel> deleteRequest({
    String? path,
    Map<String, dynamic>? params,
  }) async {
    try {
      final Response<Map<String, dynamic>> response =
          await dio.delete(path ?? '', queryParameters: params);

      if (kDebugMode) {
        log(response.data.toString());
      }

      return ResponseModel(
        result: true,
        data: response.data,
        message: 'success'.tr(),
      );
    } catch (e) {
      return _handleError(e);
    }
  }

  @override
  Future<ResponseModel> getRequest({
    String? path,
    Map<String, dynamic>? params,
  }) async {
    try {
      final Response<Map<String, dynamic>> response =
          await dio.get(path ?? '', queryParameters: params);

      if (kDebugMode) {
        log(response.data.toString());
      }

      return ResponseModel(
        result: true,
        data: response.data,
        message: 'success'.tr(),
      );
    } catch (e) {
      return _handleError(e);
    }
  }

  @override
  Future<ResponseModel> postRequest({
    String? path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? data,
  }) async {
    try {
      final Response<Map<String, dynamic>> response =
          await dio.post(path ?? '', queryParameters: params, data: data);

      if (kDebugMode) {
        log(response.data.toString());
      }

      return ResponseModel(
        result: true,
        data: response.data,
        message: 'success'.tr(),
      );
    } catch (e) {
      return _handleError(e);
    }
  }

  @override
  Future<ResponseModel> putRequest({
    String? path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? data,
  }) async {
    try {
      final Response<Map<String, dynamic>> response =
          await dio.post(path ?? '', queryParameters: params, data: data);

      if (kDebugMode) {
        log(response.data.toString());
      }

      return ResponseModel(
        result: true,
        data: response.data,
        message: 'success'.tr(),
      );
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<ResponseModel> _handleError(dynamic error) async {
    if (error is DioException) {
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.connectionError) {
        Fluttertoast.showToast(msg: 'check_internet_connection'.tr());
      }
      return ResponseModel(
        result: false,
        message: error.response.toString(),
      );
    } else {
      return ResponseModel(
        result: false,
        message: error.toString(),
      );
    }
  }
}
