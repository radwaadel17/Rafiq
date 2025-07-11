import 'package:app/core/utlis/api_service.dart';
import 'package:app/features/forget_password/data/data%20sources/remote_data_source_forget.dart';
import 'package:dio/dio.dart';

class RemoteDataSourceForgetImp implements RemoteDataSourceForget {
  ApiService apiService ;
  RemoteDataSourceForgetImp(this.apiService);
  
  @override
  Future<void> forgetPassword({required String email}) async {
    Response response = await apiService.postMethod(endPoint: '/api/users/forgetpassword', userData: {
      'email' : email ,
    }, isFormData: false);

  }
  
  @override
  Future<String> resetPassord({required String email, required String password1, required String password2}) async {
    Response response = await apiService.patch(endPoint: '}/api/users/resetpassword', data: {
      'email' : email ,
      "password" : password1 , 
      "passwordConfirmation" : password2,
    });
    return response.data;
  }
  
  @override
  Future<String> verfiyPasswordResetCode({required String email, required String resetCode}) async{
    Response response = await apiService.postMethod(endPoint: '/api/users/verifyResetCode', userData: {
      'email' : email ,
      "passwordResetCode" : resetCode,
    }, isFormData: false);
    return response.data;
  }
}