import '../app/models/response_model.dart';

abstract class NetworkRepository {
  Future<ResponseModel> getRequest(String path, {Map<String, dynamic>? params});
  Future<ResponseModel> postRequest(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? data,
  });
  Future<ResponseModel> putRequest(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? data,
  });
  Future<ResponseModel> deleteRequest(
    String path, {
    Map<String, dynamic>? params,
  });
}
