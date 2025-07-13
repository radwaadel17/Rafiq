import 'package:app/features/doctors/domain/entity/doctor_entity.dart';

class DoctorsCubitState {}

class DoctorsCubitStateInit extends DoctorsCubitState {}

class DoctorsCubitLoadingState extends DoctorsCubitState {}

class DoctorsCubitFaluireState extends DoctorsCubitState {
  final String errorMessage;
  DoctorsCubitFaluireState(this.errorMessage);
}

class DoctorsCubitSucsessState extends DoctorsCubitState {
  final List<DoctorModel> doctors;
  DoctorsCubitSucsessState({required this.doctors});
}
