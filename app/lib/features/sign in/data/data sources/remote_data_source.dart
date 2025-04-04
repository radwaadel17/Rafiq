import 'package:app/core/utlis/api_service.dart';
import 'package:app/features/sign%20in/domain/entity/user_signin_entity.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<Map<String , dynamic>> logIn(UserSigninEntity user);
}

class RemoteDataSourceImpIn implements RemoteDataSource {
  ApiService apiService ;
  RemoteDataSourceImpIn(this.apiService);
  @override
  Future<Map<String , dynamic>> logIn(UserSigninEntity user) async {
    Response response = await apiService.postMethod(endPoint: '/api/auth/login', userData: {
      'email' : user.email ,
      'password' : user.password ,
    }, isFormData: false);
    return response.data;
  }
}