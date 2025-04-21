import 'package:app/features/sign%20up/domain/repos/sign_up_repo.dart';
import 'package:app/features/sign%20up/presentation/manager/verfiy%20email%20cubit/verfiy_email_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerfiyEmailCubit extends Cubit<VerfiyEmailState> {
  VerfiyEmailCubit(this.signUpRepo) : super(VerfiyEmailStatesInit());
  final SignUpRepo signUpRepo;

  Future<void> verfiyEmail(
      {required String email, required String code}) async {
    emit(VerfiyEmailLoadingStates());
    var result = await signUpRepo.verfiyEmail(email: email, code: code);
    result.fold((faluire) {
      emit(VerfiyEmailFaluireStates(faluire.errorMessage));
    }, (confirm) {
      emit(VerfiyEmailSucssesStates(confirm));
    });
  }
}
