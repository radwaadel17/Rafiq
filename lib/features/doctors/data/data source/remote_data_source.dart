import 'package:app/features/doctors/domain/entity/doctor_entity.dart';

abstract class RemoteDataSource {
  Future<List<DoctorModel>> getDoctors();
}
