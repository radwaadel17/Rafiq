import 'package:app/core/utlis/api_service.dart';
import 'package:app/features/sign%20up/data/data%20source/remote_data_source_imp.dart';
import 'package:app/features/sign%20up/data/repos/sign_up_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<SignUpRepoImp>(SignUpRepoImp(RemoteDataSourceImp(ApiService(Dio()))));
}