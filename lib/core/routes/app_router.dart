import 'package:fitme/core/routes/routes.dart';
import 'package:fitme/feature/auth/presentation/screen/home_screen.dart';
import 'package:fitme/feature/auth/presentation/screen/login_screen.dart';
import 'package:fitme/feature/onboarding/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
    return null;
  }
}
