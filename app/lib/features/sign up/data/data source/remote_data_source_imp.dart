import 'package:app/core/utlis/api_service.dart';
import 'package:app/features/sign%20up/data/data%20source/remote_data_source.dart';
import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';
import 'package:dio/dio.dart';

class RemoteDataSourceImp implements RemoteDataSource{
  ApiService apiService ;
  RemoteDataSourceImp(this.apiService);
  @override
  Future<String> signUp(UserSignupEntity user) async{
    Response responseString = await apiService.postMethod(
      endPoint: 'api/users/register',
       userData: {
      "name": user.name,
      "email": user.email,
      "password": user.passowrd,
      "passwordConfirmation": user.passwordConfirmation,
      "phoneNumber": user.phoneNumber,
      "role": user.role }, isFormData: false);
    return responseString.data;
  }
}