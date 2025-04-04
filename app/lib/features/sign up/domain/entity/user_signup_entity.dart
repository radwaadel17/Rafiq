class UserSignupEntity {
  String? name;
  String? email;
  String? passowrd;
  String? passwordConfirmation;
  num? phoneNumber;
  String? role;
  UserSignupEntity(
      {required this.name,
      required this.email,
      required this.passowrd,
      required this.passwordConfirmation,
      required this.phoneNumber,
      required this.role});
}
