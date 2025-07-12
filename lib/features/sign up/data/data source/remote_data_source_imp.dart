import 'package:app/core/utlis/api_service.dart';
import 'package:app/features/sign%20up/data/data%20source/remote_data_source.dart';
import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';
import 'package:dio/dio.dart';

class RemoteDataSourceImp implements RemoteDataSource {
  ApiService apiService;
  RemoteDataSourceImp(this.apiService);
  @override
  Future<String> signUp(UserSignupDoctorEntity user) async {
    Response responseString ;
    if(user.role == 'doctor'){
        responseString = await apiService.postMethod(
        endPoint: '/api/users/register',
        userData: {
          "name": user.name,
          "email": user.email,
          "password": user.passowrd,
          "passwordConfirmation": user.passwordConfirmation,
          "phoneNumber": user.phoneNumber,
          "role": user.role,
          "identityVerification": user.identityVerification,
          "selfiePhoto": user.selfiePhoto,
          "specialization": user.specialization,
          "description": user.description,
          "clinicLocation": user.clinicLocation,  
          "appointments": user.appointments,  
          "rating": user.rating,
          "children": user.children,
        },
        isFormData: false);
    }
    else{
      responseString = await apiService.postMethod(
        endPoint: '/api/users/register',
        userData: {
          "name": user.name,
          "email": user.email,
          "password": user.passowrd,
          "passwordConfirmation": user.passwordConfirmation,
          "phoneNumber": user.phoneNumber,
          "role": user.role,
          "children": user.children,
        },
        isFormData: false);
        print(user.children);
        print(user.name);
        print(user.phoneNumber);
        print(user.email);
        print(user.passowrd);
        print(user.passwordConfirmation);
        print(user.role); 
    }
 
    return responseString.data['PreviewURL'];
  }

  @override
  Future<String> verfiyEmail(
      {required String email, required String code}) async {
    Response response =
        await apiService.patch(endPoint: '/api/users/verify/$email/$code');
    return response.data;
  }
}
