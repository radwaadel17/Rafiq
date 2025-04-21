class SignInCubitState {}

class SignInCubitStateInit extends SignInCubitState {}

class SignInCubitLoadingState extends SignInCubitState {}

class SignInCubitFaluireState extends SignInCubitState {
  final String errorMessage;
  SignInCubitFaluireState(this.errorMessage);
}

class SignInCubitSucsessState extends SignInCubitState {
  final String accsesToken;
  final String refreshToken;
  SignInCubitSucsessState(
      {required this.accsesToken, required this.refreshToken});
}
