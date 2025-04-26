import 'package:flutter/material.dart';
import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';

void main() async {
  setupGetIt();
  // this is required to fix hidding text bug in flutter_screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}
