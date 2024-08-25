// ignore_for_file: unnecessary_null_comparison

import 'package:get_it/get_it.dart';
import 'package:job_search/core/utils/JSAppString.dart';
import 'package:job_search/data/repositories/home_repo.dart';
import 'package:job_search/data/repositories/profile_repo.dart';
import 'package:job_search/data/repositories/sign_up_repo.dart';
import 'package:job_search/provider/profile_provider.dart';
import 'package:job_search/provider/sign_up_provider.dart';

import 'data/data_source/http_helper.dart';
import 'data/repositories/favorite_repo.dart';
import 'data/repositories/sign_in_repo.dart';
import 'provider/favorite_provider.dart';
import 'provider/home_provider.dart';
import 'provider/sign_in_provider.dart';

final sl = GetIt.instance;
// String myBaseUrl = '';

Future<void> serviceLocatorInit() async {
  sl.allowReassignment = true;
  // Core
  sl.registerFactory(() => ApiBaseHelper(AppStrings.baseUrl));

  //REPOSITORIES
  sl.registerLazySingleton(() => SignUpRepository(apiHelper: sl()));
  sl.registerLazySingleton(() => SignInRepository(apiHelper: sl()));
  sl.registerLazySingleton(() => HomeRepository(apiHelper: sl()));
  sl.registerLazySingleton(() => FavoriteRepository(apiHelper: sl()));
  sl.registerLazySingleton(() => ProfileRepository(apiHelper: sl()));
  //provider
  sl.registerFactory(() => SignUpProvider(repository: sl()));
  sl.registerFactory(() => SignInProvider(repository: sl()));
  sl.registerFactory(() => HomeProvider(sl()));
  sl.registerFactory(() => FavoriteProvider(sl()));
  sl.registerFactory(() => ProfileProvider(sl()));
}

Future<void> resetAndReinitializeLocator() async {
  await sl.reset();
  await serviceLocatorInit();
}
