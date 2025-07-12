import 'package:app/core/errors/faluire_model.dart';
import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpRepo {
  Future<Either<Faluire , String>> signUp(UserSignupDoctorEntity user);
  Future<Either<Faluire , String>> verfiyEmail({required String email , required String code});
}