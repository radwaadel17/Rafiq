import 'package:app/features/forget_password/domain/repos/forget_password_repo.dart';
import 'package:app/features/forget_password/presentation/manager/reset%20password%20cubit/reset_password_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.forgetPasswordRepo)
      : super(ResetPasswordStateinit());
  ForgetPasswordRepo forgetPasswordRepo;

  Future<void> resetPassword({required String email , required String pass1 , required String pass2}) async {
    emit(ResetPasswordLoadingState());
    var result = await forgetPasswordRepo.resetPassord(email: email, password1: pass1, password2: pass2);
    result.fold((faluire) {
      emit(ResetPasswordFaluireState(faluire.errorMessage));
    }, (reset) {
      emit(ResetPasswordSucssesStateinit(reset));
    });
  }
}
