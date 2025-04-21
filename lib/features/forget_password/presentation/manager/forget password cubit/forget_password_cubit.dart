import 'package:app/features/forget_password/domain/repos/forget_password_repo.dart';
import 'package:app/features/forget_password/presentation/manager/forget%20password%20cubit/forget_password_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPasswordRepo)
      : super(ForgetPasswordStateinit());
  ForgetPasswordRepo forgetPasswordRepo;

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoadingState());
    var result = await forgetPasswordRepo.forgetPassword(email: email);
    result.fold((faluire) {
      emit(ForgetPasswordFaluireState(faluire.errorMessage));
    }, (ifRight) {
      emit(ForgetPasswordSucssesState());
    });
  }
}
