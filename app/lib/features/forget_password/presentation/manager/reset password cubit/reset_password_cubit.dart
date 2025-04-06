import 'package:app/features/forget_password/domain/repos/forget_password_repo.dart';
import 'package:app/features/forget_password/presentation/manager/reset%20password%20cubit/reset_password_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.forgetPasswordRepo)
      : super(ResetPasswordStateinit());
  ForgetPasswordRepo forgetPasswordRepo;

  Future<void> resetPassword({required String email , required String resetCode}) async {
    emit(ResetPasswordLoadingState());
    var result = await forgetPasswordRepo.resetPassword(email: email , resetCode: resetCode);
    result.fold((faluire) {
      emit(ResetPasswordFaluireState(faluire.errorMessage));
    }, (reset) {
      emit(ResetPasswordSucssesStateinit(reset));
    });
  }
}
