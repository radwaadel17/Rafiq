abstract class RemoteDataSourceForget {
  Future<void> forgetPassword({required String email});
  Future<String> resetPassword({required String email , required String resetCode});
}