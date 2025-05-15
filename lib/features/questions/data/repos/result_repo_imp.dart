import 'package:app/core/errors/faluire_model.dart';
import 'package:app/features/questions/data/data%20sources/remote_data_source.dart';
import 'package:app/features/questions/domain/entity/qs_entity.dart';
import 'package:app/features/questions/domain/entity/result_entity.dart';
import 'package:app/features/questions/domain/repos/result_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ResultRepoImp implements ResultRepo {
  RemoteDataSourceQs remoteDataSourceQs;
  ResultRepoImp(this.remoteDataSourceQs);
  @override
  Future<Either<Faluire, ResultEntity>> getResult(
      {required QsEntity qsEntity}) async {
    try {
      ResultEntity resultEntity =
          await remoteDataSourceQs.getResult(qsEntity: qsEntity);
      return right(resultEntity);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.FromDioError(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
