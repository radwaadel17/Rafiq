import 'package:app/core/utlis/api_service.dart';
import 'package:app/features/sign%20up/data/data%20source/remote_data_source.dart';
import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';
import 'package:dio/dio.dart';

class RemoteDataSourceImp implements RemoteDataSource {
  ApiService apiService;
  RemoteDataSourceImp(this.apiService);
  @override
  Future<String> signUp(UserSignupEntity user) async {
    Response responseString = await apiService.postMethod(
        endPoint: '/api/users/register',
        userData: {
          "name": user.name,
          "email": user.email,
          "password": user.passowrd,
          "passwordConfirmation": user.passwordConfirmation,
          "phoneNumber": user.phoneNumber,
          "role": user.role
        },
        isFormData: false);
    print("Name: ${user.name}");
    print("Email: ${user.email}");
    print("Password: ${user.passowrd}");
    print("Password Confirmation: ${user.passwordConfirmation}");
    print("Phone Number: ${user.phoneNumber}");
    print("Role: ${user.role}");
    return responseString.data;
  }

  @override
  Future<String> verfiyEmail(
      {required String email, required String code}) async {
    Response response =
        await apiService.patch(endPoint: '/api/users/verify/$email/$code');
    return response.data;
  }
}
