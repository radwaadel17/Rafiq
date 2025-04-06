abstract class RemoteDataSourceForget {
  Future<String> forgetPassword({required String email});
  Future<String> resetPassword({required String password , required String resetCode});
}