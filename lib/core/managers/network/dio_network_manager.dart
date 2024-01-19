import 'dart:developer';

import 'package:aisistant/core/repository/network_repository.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

import '../../app/models/response_model.dart';

class DioManager extends NetworkRepository {
  static Dio? _dio;

  static Dio get dio {
    _dio ??= Dio(
      BaseOptions(
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        contentType: Headers.jsonContentType,
        connectTimeout: const Duration(milliseconds: 200),
        receiveTimeout: const Duration(seconds: 200),
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
      return ResponseModel(
          result: true, data: response.data, message: "success".tr());
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
  Future<ResponseModel> getRequest(String path,
      {Map<String, dynamic>? params}) async {
    try {
      final response = await dio.get(path, queryParameters: params);

      return ResponseModel(
          result: true, data: response.data, message: "success".tr());
    } on DioException catch (e) {
      if (kDebugMode) {
        log(e.response.toString());
        log(e.response!.realUri.toString());
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
  Future<ResponseModel> postRequest(String path,
      {Map<String, dynamic>? params, Map<String, dynamic>? data}) async {
    try {
      final response =
          await dio.post(path, queryParameters: params, data: data);
      if (kDebugMode) {
        log(response.data.toString());
      }
      return ResponseModel(
          result: true, data: response.data, message: "success".tr());
    } on DioException catch (e) {
      if (kDebugMode) {
        log(e.response.toString());
        log(e.response!.realUri.toString());
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
      return ResponseModel(
          result: true, data: response.data, message: "success".tr());
    } catch (e) {
      return ResponseModel(
        result: false,
        message: e.toString(),
      );
    }
  }
}
