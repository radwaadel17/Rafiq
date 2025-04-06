import 'package:app/core/errors/faluire_model.dart';
import 'package:dartz/dartz.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Faluire , void>> forgetPassword({required String email});
  Future<Either<Faluire , String>> resetPassword({required String password , required String resetCode});
}