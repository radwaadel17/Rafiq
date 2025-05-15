import 'dart:io';

import 'package:app/core/errors/faluire_model.dart';
import 'package:app/features/questions/domain/entity/qs_entity.dart';
import 'package:app/features/questions/domain/entity/result_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ResultRepo {
  Future<Either<Faluire , ResultEntity>>getResult({required QsEntity qsEntity});
}