import 'package:fitme/core/helper/function/animated_page_route.dart';
import 'package:fitme/core/routes/routes.dart';
import 'package:fitme/feature/auth/presentation/screen/forgot_password_screen.dart';
import 'package:fitme/feature/auth/presentation/screen/login_screen.dart';
import 'package:fitme/feature/auth/presentation/screen/register_screen.dart';
import 'package:fitme/feature/home/presentation/screens/bottom_nav_bar_screen.dart';
import 'package:fitme/feature/onboarding/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return smoothEaseInOutPageRoute(OnBoardingScreen());
      case Routes.loginScreen:
        return smoothEaseInOutPageRoute(LoginScreen());
      case Routes.forgotPasswordScreen:
        return smoothEaseInOutPageRoute(ForgotPasswordScreen());
      case Routes.registerScreen:
        return smoothEaseInOutPageRoute(RegisterScreen());
      case Routes.navBarScreen:
        return smoothEaseInOutPageRoute(BottomNavBarScreen());
    }
    return null;
  }
}
