import 'package:app/core/errors/faluire_model.dart';
import 'package:app/features/doctors/data/data%20source/remote_data_source.dart';
import 'package:app/features/doctors/domain/entity/doctor_entity.dart';
import 'package:app/features/doctors/domain/repos/doctor_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DoctorsRepoImp implements DoctorsRepo {
  RemoteDataSource remoteDataSource;
  DoctorsRepoImp(this.remoteDataSource);

  @override
  Future<Either<Faluire, List<DoctorModel>>> getDoctors() async {
    try {
      List<DoctorModel> response = await remoteDataSource.getDoctors();
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.FromDioError(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
