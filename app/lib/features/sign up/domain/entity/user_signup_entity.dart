class UserSignupEntity {
  final String name;
  final String email;
  final String passowrd;
  final String passwordConfirmation;
  final num phoneNumber;
  final String role;
  UserSignupEntity(
      {
      required this.name,
      required this.email,
      required this.passowrd,
      required this.passwordConfirmation,
      required this.phoneNumber,
      required this.role});
}
