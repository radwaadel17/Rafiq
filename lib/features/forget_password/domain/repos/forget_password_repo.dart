import 'package:app/core/errors/faluire_model.dart';
import 'package:dartz/dartz.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Faluire , void>> forgetPassword({required String email});
  Future<Either<Faluire , String>> verfiyPasswordResetCode({required String email, required String resetCode});
  Future<Either<Faluire , String>> resetPassord({required String email , required String password1 , required String password2});
}