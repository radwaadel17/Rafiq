import 'package:dio/dio.dart';

class ApiService {
  final Dio dio ;
  ApiService(this.dio);
  final String baseUrl = 'https://minimum-birdie-autism-e4d0ba7d.koyeb.app';
  Future<dynamic> postMethod(
      {required String endPoint,
      required dynamic userData,
      required bool isFormData,
     }) async {
    Response response = await dio.post(
      '$baseUrl$endPoint',
      data: isFormData ? FormData.fromMap(userData) : userData,
    );
    return response;
  }
}