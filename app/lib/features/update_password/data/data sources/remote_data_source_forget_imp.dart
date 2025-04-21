import 'package:app/core/utlis/api_service.dart';
import 'package:app/features/update_password/data/data%20sources/remote_data_source_forget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class RemoteDataSourceForgetImp implements RemoteDataSourceForget {
  ApiService apiService ;
  RemoteDataSourceForgetImp(this.apiService);
  @override
  Future<void> forgetPassword({required String email})async {
   // ignore: unused_local_variable
   Response response =  await apiService.postMethod(endPoint: '/api/users/forgetpassword', userData: {
     "email": email
   }, isFormData: false);
   debugPrint('${response.data['Preview URL']}');
  }
  @override
  Future<String> resetPassword({required String email, required String resetCode}) async{
   Response response = await apiService.patch(endPoint: '/api/users/resetpassword/$email/$resetCode');
   return response.data;
  }
}