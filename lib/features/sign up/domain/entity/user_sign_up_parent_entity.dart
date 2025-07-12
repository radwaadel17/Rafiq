class UserSignUpParentEntity {
  String? name;
  String? email;
  String? password; 
  String? passwordConfirmation;
  num? phoneNumber;
  String? role;
  List<dynamic>? children;
  UserSignUpParentEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.phoneNumber,
    required this.role,
    required this.children,
  });

}
