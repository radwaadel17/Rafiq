import 'package:app/features/sign%20in/domain/entity/user_signin_entity.dart';
import 'package:app/features/sign%20in/domain/repos/signin_repo.dart';
import 'package:app/features/sign%20in/presentation/manager/sign_in_cubit/sign_in_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInCubitState>{
  SignInCubit(this.signInRepo):super(SignInCubitStateInit());
  final SignInRepo signInRepo ;
   Future<void> logIn(UserSigninEntity user) async{
    emit(SignInCubitLoadingState());
    var result = await signInRepo.logIn(user);
     result.fold((faluire){
      emit(SignInCubitFaluireState(faluire.errorMessage));
     }, (confirm){
      emit(SignInCubitSucsessState(accsesToken: confirm['accessToken'], refreshToken: confirm['refreshToken']));
     });
   }
   
}