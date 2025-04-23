class VerfiyEmailState {}

class VerfiyEmailStatesInit extends VerfiyEmailState {}

class VerfiyEmailFaluireStates extends VerfiyEmailState {
  final String errorMsg;
  VerfiyEmailFaluireStates(this.errorMsg);
}

class VerfiyEmailLoadingStates extends VerfiyEmailState {}

class VerfiyEmailSucssesStates extends VerfiyEmailState {
  final String msg;
  VerfiyEmailSucssesStates(this.msg);
}
