import '../abstracts/network_service.dart';
import '../models/response_model.dart';

class NetworkRepository implements NetworkService {
  final NetworkService _networkService;

  NetworkRepository({required NetworkService networkService})
      : _networkService = networkService;

  @override
  Future<ResponseModel> deleteRequest(String path,
      {Map<String, dynamic>? params}) async {
    return await _networkService.deleteRequest(path, params: params);
  }

  @override
  Future<ResponseModel> getRequest(String path,
      {Map<String, dynamic>? params}) async {
    return await _networkService.getRequest(path, params: params);
  }

  @override
  Future<ResponseModel> postRequest(String path,
      {Map<String, dynamic>? params, Map<String, dynamic>? data}) async {
    return await _networkService.postRequest(path, params: params, data: data);
  }

  @override
  Future<ResponseModel> putRequest(String path,
      {Map<String, dynamic>? params, Map<String, dynamic>? data}) async {
    return await _networkService.putRequest(path, params: params, data: data);
  }
}
