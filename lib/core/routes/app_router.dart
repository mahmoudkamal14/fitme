import 'package:fitme/core/routes/routes.dart';
import 'package:fitme/feature/onboarding/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
    }
    return null;
  }
}
