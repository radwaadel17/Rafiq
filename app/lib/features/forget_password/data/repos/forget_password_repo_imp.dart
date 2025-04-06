import 'package:app/core/errors/faluire_model.dart';
import 'package:app/features/forget_password/data/data%20sources/remote_data_source_forget.dart';
import 'package:app/features/forget_password/domain/repos/forget_password_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ForgetPasswordRepoImp implements ForgetPasswordRepo{
  RemoteDataSourceForget remoteDataSourceForget ;
  ForgetPasswordRepoImp(this.remoteDataSourceForget);
  @override
  Future<Either<Faluire, void>> forgetPassword({required String email}) async{
    try {
     await remoteDataSourceForget.forgetPassword(email: email);
     return right(null);
    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.FromDioError(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
  @override
  Future<Either<Faluire, String>> resetPassword({required String email, required String resetCode}) async{
    try {
      String response = await remoteDataSourceForget.resetPassword(email: email, resetCode: resetCode);
      return right(response);
    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.FromDioError(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

}