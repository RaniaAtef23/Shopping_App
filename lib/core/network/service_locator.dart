import 'package:animal_app/core/network/api_service.dart';
import 'package:animal_app/features/Home/data/repo/repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<api_service>(api_service(Dio()));
  getIt.registerSingleton<RepoHomeImpl>(RepoHomeImpl(apisevice: getIt.get<api_service>()));
}