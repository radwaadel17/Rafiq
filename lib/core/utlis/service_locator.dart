import 'package:app/core/utlis/api_service.dart';
import 'package:app/features/questions/data/data%20sources/remote_data_source_imp.dart';
import 'package:app/features/questions/data/repos/result_repo_imp.dart';
import 'package:app/features/sign%20in/data/data%20sources/remote_data_source.dart';
import 'package:app/features/sign%20in/data/repos/sign_in_repo_imp.dart';
import 'package:app/features/sign%20up/data/data%20source/remote_data_source_imp.dart';
import 'package:app/features/sign%20up/data/repos/sign_up_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<SignUpRepoImp>(SignUpRepoImp(RemoteDataSourceImp(ApiService(Dio()))));
  getIt.registerSingleton<SignInRepoImp>(SignInRepoImp(RemoteDataSourceImpIn(ApiService(Dio()))));
  getIt.registerSingleton<ResultRepoImp>(ResultRepoImp(RemoteDataSourceImpQs(ApiService(Dio()))));
}