// ignore_for_file: unnecessary_null_comparison

import 'package:get_it/get_it.dart';
import 'package:job_search/core/utils/JSAppString.dart';
import 'package:job_search/data/repositories/sign_up_repo.dart';
import 'package:job_search/provider/sign_up_provider.dart';

import 'data/data_source/http_helper.dart';

final sl = GetIt.instance;
// String myBaseUrl = '';

Future<void> serviceLocatorInit() async {
  sl.allowReassignment = true;
  // Core
  sl.registerFactory(() => ApiBaseHelper(AppStrings.baseUrl));

  //REPOSITORIES
  sl.registerLazySingleton(() => SignUpRepository(apiHelper: sl()));

  //provider
  sl.registerFactory(() => SignUpProvider(repository: sl()));
}

Future<void> resetAndReinitializeLocator() async {
  await sl.reset();
  await serviceLocatorInit();
}
