import 'package:app/core/errors/faluire_model.dart';
import 'package:app/features/forget_password/data/data%20sources/remote_data_source_forget.dart';
import 'package:app/features/forget_password/domain/repos/forget_password_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ForgetPasswordRepoImp implements ForgetPasswordRepo {
  RemoteDataSourceForget remoteDataSourceImp;
  ForgetPasswordRepoImp(this.remoteDataSourceImp);
  @override
  Future<Either<Faluire, void>> forgetPassword({required String email}) async {
    try {
      var result = await remoteDataSourceImp
        .forgetPassword(email: email);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.FromDioError(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Faluire, String>> resetPassord(
      {required String email,
      required String password1,
      required String password2})async {
     try {
      var result = await remoteDataSourceImp.resetPassord(email: email , password1: password1 , password2: password2);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.FromDioError(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Faluire, String>> verfiyPasswordResetCode(
      {required String email, required String resetCode})
      async {
     try {
      var result = await remoteDataSourceImp.verfiyPasswordResetCode(email: email , resetCode:  resetCode);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.FromDioError(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
