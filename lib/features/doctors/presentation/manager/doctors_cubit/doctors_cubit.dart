import 'package:app/features/doctors/domain/entity/doctor_entity.dart';
import 'package:app/features/doctors/domain/repos/doctor_repo.dart';
import 'package:app/features/doctors/presentation/manager/doctors_cubit/doctors_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsCubit extends Cubit<DoctorsCubitState> {
  DoctorsCubit(this.doctorsRepo) : super(DoctorsCubitStateInit());
  final DoctorsRepo doctorsRepo;
  List<DoctorModel> doctors = [];

  Future<void> getDoctors() async {
    emit(DoctorsCubitLoadingState());
    var result = await doctorsRepo.getDoctors();
    result.fold((faluire) {
      emit(DoctorsCubitFaluireState(faluire.errorMessage));
    }, (doctors) {
      this.doctors = doctors;
      emit(DoctorsCubitSucsessState(doctors: doctors));
    });
  }
}
