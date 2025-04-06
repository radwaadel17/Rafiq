class ForgetPasswordState {}

class ForgetPasswordStateinit extends ForgetPasswordState {}

class ForgetPasswordFaluireState extends ForgetPasswordState {
  final String errorMessage;
  ForgetPasswordFaluireState(this.errorMessage);
}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordSucssesState extends ForgetPasswordState {
  
}
