import 'package:dio/dio.dart';
import 'package:docdoc/Core/networking/api_service.dart';
import 'package:docdoc/Core/networking/dio_factory.dart';
import 'package:docdoc/Features/home/data/apis/home_api_service.dart';
import 'package:docdoc/Features/home/data/repos/home_repo_.dart';
import 'package:docdoc/Features/login/data/repos/login_repo.dart';
import 'package:docdoc/Features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/Features/sign_up/data/repos/sign_up_repo.dart';
import 'package:docdoc/Features/sign_up/logic/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
