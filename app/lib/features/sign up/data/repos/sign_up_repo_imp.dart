import 'package:app/core/errors/faluire_model.dart';
import 'package:app/features/sign%20up/data/data%20source/remote_data_source.dart';
import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';
import 'package:app/features/sign%20up/domain/repos/sign_up_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SignUpRepoImp implements SignUpRepo {
  RemoteDataSource remoteDataSource;
  SignUpRepoImp(this.remoteDataSource);
  @override
  Future<Either<Faluire, String>> signUp(UserSignupEntity user) async {
    try {
      String response = await remoteDataSource.signUp(user);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.FromDioError(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
