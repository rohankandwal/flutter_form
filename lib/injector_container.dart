import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_example_app/feature/domain/usecase/check_data_history_usecase.dart';
import 'package:flutter_example_app/feature/presentation/bloc/my_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/network_info.dart';
import 'core/utils/my_shared_pref.dart';
import 'feature/data/client/client.dart';
import 'feature/data/datasource/local_datasource.dart';
import 'feature/data/datasource/remote_datasource.dart';
import 'feature/data/repositories/repository_impl.dart';
import 'feature/domain/repositories/repository.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerFactory(() => MyBloc(
    getLastLoadedUseCase: sl()
  ));

  sl.registerLazySingleton(() => GetLastLoadedUseCase(sl()));

  // repository
  sl.registerLazySingleton<Repository>(() => RepositoryImpl(
      localDataSource: sl(), remoteDataSource: sl(), networkInfo: sl()));

  // Data Sources
  sl.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImpl(client: sl()));
  // No access to DB provider, job of LocalDataSource to choose which source
  sl.registerLazySingleton<LocalDataSource>(
          () => LocalDataSourceImpl(mySharedPref: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<MySharedPref>(() => MySharedPref(sl()));

  // initializing dio
  final dio = Dio();
  dio.interceptors.add(LogInterceptor(request: true, responseBody: true));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton(() => RestClient(dio, sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());
}