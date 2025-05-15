import 'package:app/features/questions/domain/entity/qs_entity.dart';
import 'package:app/features/questions/domain/entity/result_entity.dart';

abstract class RemoteDataSourceQs {
  Future<ResultEntity> getResult({required QsEntity qsEntity});
}
