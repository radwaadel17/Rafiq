import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService(this.dio);
  final String baseUrl = 'https://minimum-birdie-autism-e4d0ba7d.koyeb.app';
  Future<dynamic> postMethod({
    required String endPoint,
    required dynamic userData,
    required bool isFormData,
  }) async {
    Response response = await dio.post(
      '$baseUrl$endPoint',
      data: isFormData ? FormData.fromMap(userData) : userData,
    );
    return response;
  }

  Future<dynamic> patch({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    final response = await dio.patch(
      '$baseUrl$endPoint',
      data: data, // لو null مفيش مشكلة
    );
    return response;
  }

  Future<dynamic> postMethodQs({
    required String url,
    required dynamic userData,
    required bool isFormData,
  }) async {
    Response response = await dio.post(
      url,
      data: isFormData ? FormData.fromMap(userData) : userData,
    );
    return response;
  }

  Future<dynamic> getMethod({
    required String endPoint,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await dio.get(
      '$baseUrl$endPoint',
      queryParameters: queryParams,
    );
    return response;
  }
}
