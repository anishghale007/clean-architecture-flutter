import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v_commerce_vendor/core/util/text_validator.dart';
import 'package:v_commerce_vendor/register/data/datasources/register_user_datasoure.dart';
import 'package:v_commerce_vendor/register/data/repositories/register_user_repository_impl.dart';
import 'package:v_commerce_vendor/register/domain/repositories/register_user_repository.dart';
import 'package:v_commerce_vendor/register/domain/usecases/register_new_user.dart';
import 'package:v_commerce_vendor/register/presentation/bloc/register_bloc.dart';

import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
//bloc

// register bloc
  sl.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerNewUser: sl(),
      textValidator: sl(),
    ),
  );

//usecase

// register use case
  sl.registerLazySingleton<RegisterNewUser>(
    () => RegisterNewUser(
      registerUserRepository: sl(),
    ),
  );

  //repository

  // register repository
  sl.registerLazySingleton<RegisterUserRepository>(
    () => RegisterUserRepositoryImpl(
      registerUserDataSource: sl(),
    ),
  );

  //data sources

  //register data  sources
  sl.registerLazySingleton<RegisterUserDatasource>(
    () => RegisterUserDataSourceImpl(
      dio: sl(),
    ),
  );

  //core

  //network info --> internet connected or not
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  // validator for input textfield
  sl.registerLazySingleton<TextValidator>(
    () => TextValidator(),
  );

  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  sl.registerLazySingleton<Dio>(
    () => Dio(),
  );

  sl.registerLazySingleton<Connectivity>(
    () => Connectivity(),
  );
}
