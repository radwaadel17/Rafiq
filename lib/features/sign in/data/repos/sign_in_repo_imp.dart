import 'package:app/core/errors/faluire_model.dart';
import 'package:app/features/sign%20in/data/data%20sources/remote_data_source.dart';
import 'package:app/features/sign%20in/domain/entity/user_signin_entity.dart';
import 'package:app/features/sign%20in/domain/repos/signin_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SignInRepoImp implements SignInRepo {
  RemoteDataSourceImpIn remoteDataSourceImp;
  SignInRepoImp(this.remoteDataSourceImp);
  @override
  Future<Either<Faluire, String>> logIn(
      UserSigninEntity user) async {
    try {
      var result = await remoteDataSourceImp.logIn(user);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.FromDioError(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
