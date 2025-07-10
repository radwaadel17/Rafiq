import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';

abstract class RemoteDataSource {
  Future<Map<String , dynamic>> signUp(UserSignupEntity user);
  Future<String> verfiyEmail({required String email , required String code});
}