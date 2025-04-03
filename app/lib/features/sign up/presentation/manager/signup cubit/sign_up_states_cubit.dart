class SignUpState {}

class SignUpintial extends SignUpState {}

class SignUpStatesCubit extends SignUpState {}

class SignupSuccesesState extends SignUpState {
  final String message;
  SignupSuccesesState(this.message);
}

class SignupFaluireState extends SignUpState {
  final String errorMsg;
  SignupFaluireState(this.errorMsg);
}
