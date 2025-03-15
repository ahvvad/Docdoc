import 'package:docdoc/Features/login/ui/login_screen.dart';
import 'package:docdoc/Features/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const Onboarding(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined ${settings.name}'),
            ),
          ),
        );
    }
  }
}
