import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';
import 'package:app/features/sign%20up/domain/repos/sign_up_repo.dart';
import 'package:app/features/sign%20up/presentation/manager/signup%20cubit/sign_up_states_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpintial());
  SignUpRepo signUpRepo;
  Future<void> signUp(UserSignupEntity user) async {
    emit(SignUpLoadingStatesCubit());
    var result = await signUpRepo.signUp(user);
    result.fold((faluire) {
      emit(SignupFaluireState(faluire.errorMessage));
    }, (msg) {
      emit(SignupSuccesesState(msg , user));
    });
  }
}
