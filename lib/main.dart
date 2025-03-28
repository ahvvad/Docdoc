import 'package:docdoc/Core/di/dependecy_injection.dart';
import 'package:docdoc/Core/routing/app_router.dart';
import 'package:flutter/material.dart';

import 'doc_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}
