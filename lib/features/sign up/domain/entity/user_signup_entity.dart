class UserSignupDoctorEntity {
  String? name;
  String? email;
  String? passowrd;
  String? passwordConfirmation;
  num? phoneNumber;
  String? role;
  String? specialization;
  String? identityVerification;
  String? selfiePhoto;
  String? description;
  String? clinicLocation;
  List<dynamic>? appointments;
  num? rating;
  List<dynamic>? children;
  UserSignupDoctorEntity(
      {
      required this.children,  
      required this.name,
      required this.email,
      required this.passowrd,
      required this.passwordConfirmation,
      required this.phoneNumber,
      required this.role,
      required this.specialization,

      
      });
}
