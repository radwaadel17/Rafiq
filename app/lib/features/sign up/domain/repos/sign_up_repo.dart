import 'package:app/core/errors/faluire_model.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpRepo {
  Future<Either<Faluire , String>> logIn();
}