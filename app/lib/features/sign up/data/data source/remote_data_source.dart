import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';

abstract class RemoteDataSource {
  Future<String> signUp(UserSignupEntity user);
}