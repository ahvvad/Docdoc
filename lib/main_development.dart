import 'package:docdoc/Core/helpers/constants.dart';
import 'package:docdoc/Core/helpers/extensions.dart';
import 'package:docdoc/Core/helpers/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:docdoc/Core/di/dependency_injection.dart';
import 'package:docdoc/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // this is required to fix hidding text bug in flutter_screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
