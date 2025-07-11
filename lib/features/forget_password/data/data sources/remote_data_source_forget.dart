abstract class RemoteDataSourceForget {


  Future<void> forgetPassword({required String email});
  Future<String> verfiyPasswordResetCode({required String email, required String resetCode});
  Future<String> resetPassord({required String email , required String password1 , required String password2});
}
