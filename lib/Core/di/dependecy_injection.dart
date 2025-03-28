import 'package:dio/dio.dart';
import 'package:docdoc/Core/networking/api_service.dart';
import 'package:docdoc/Core/networking/dio_factory.dart';
import 'package:docdoc/Features/login/data/repos/login_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
   Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // تسجيل LoginRepo
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));

  // تسجيل LoginCubit بعد LoginRepo
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
}