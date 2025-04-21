class ResetPasswordState {}

class ResetPasswordStateinit extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordFaluireState extends ResetPasswordState {
  final String errorMessage ;
  ResetPasswordFaluireState(this.errorMessage);
}

class ResetPasswordSucssesStateinit extends ResetPasswordState {
  final String msg ;
  ResetPasswordSucssesStateinit(this.msg);
}

