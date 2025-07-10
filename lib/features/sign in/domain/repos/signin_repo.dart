import 'package:app/core/errors/faluire_model.dart';
import 'package:app/features/sign%20in/domain/entity/user_signin_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SignInRepo {
Future<Either<Faluire , String>> logIn(UserSigninEntity user);
}