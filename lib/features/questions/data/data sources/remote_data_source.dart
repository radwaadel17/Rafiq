import 'package:app/core/utlis/api_service.dart';
import 'package:app/features/questions/domain/entity/qs_entity.dart';
import 'package:app/features/questions/domain/entity/result_entity.dart';

abstract class RemoteDataSourceQs {
  RemoteDataSourceQs(ApiService apiService);

  Future<ResultEntity> getResult({required QsEntity qsEntity});
}
