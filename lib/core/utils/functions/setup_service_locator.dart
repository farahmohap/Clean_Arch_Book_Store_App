import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getItLocator = GetIt.instance;

void setupServiceLocator() {
  getItLocator.registerSingleton<ApiService>(ApiService(dio: Dio()));

  getItLocator.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeRemoteDataSource:
          HomeRemoteDataSourceImpl(apiService: getItLocator.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl()));
}
