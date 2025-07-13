import 'package:app/core/errors/faluire_model.dart';
import 'package:app/features/doctors/domain/entity/doctor_entity.dart';
import 'package:dartz/dartz.dart';

abstract class DoctorsRepo {
  Future<Either<Faluire, List<DoctorModel>>> getDoctors();
}
