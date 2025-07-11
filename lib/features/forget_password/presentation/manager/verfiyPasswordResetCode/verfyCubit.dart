import 'package:app/features/forget_password/domain/repos/forget_password_repo.dart';
import 'package:app/features/forget_password/presentation/manager/verfiyPasswordResetCode/verfyPasswordStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class VerfiyCubit extends Cubit<Verfiy> {
  VerfiyCubit(this.forgetPasswordRepo) : super(Verfypasswordstates());
  ForgetPasswordRepo forgetPasswordRepo;
  Future<void> resetPassword(
      {required String email, required String resetCode}) async {
    emit(VPasswordLoadingState());
    var result = await forgetPasswordRepo.verfiyPasswordResetCode(
        email: email, resetCode: resetCode);
    result.fold((faluire) {
      emit(VPasswordFaluireState(faluire.errorMessage));
    }, (reset) {
      emit(VSucssesStateinit(reset));
    });
  }
}
