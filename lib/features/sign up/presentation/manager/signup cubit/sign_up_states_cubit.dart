import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';

class SignUpState {}

class SignUpintial extends SignUpState {}

class SignUpLoadingStatesCubit extends SignUpState {}

class SignupSuccesesState extends SignUpState {
  final String message;
  final  UserSignupEntity user; 
  SignupSuccesesState(this.message , this.user);
}

class SignupFaluireState extends SignUpState {
  final String errorMsg;
  SignupFaluireState(this.errorMsg);
}
