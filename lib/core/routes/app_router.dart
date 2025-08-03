import 'package:fitme/core/helper/function/animated_page_route.dart';
import 'package:fitme/core/routes/routes.dart';
import 'package:fitme/feature/auth/presentation/screen/forgot_password_otp_screen.dart';
import 'package:fitme/feature/auth/presentation/screen/forgot_password_screen.dart';
import 'package:fitme/feature/auth/presentation/screen/home_screen.dart';
import 'package:fitme/feature/auth/presentation/screen/login_screen.dart';
import 'package:fitme/feature/auth/presentation/screen/register_screen.dart';
import 'package:fitme/feature/auth/presentation/screen/reset_password_screen.dart';
import 'package:fitme/feature/auth/presentation/screen/verify_email_screen.dart';
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
      case Routes.forgotPasswordOTPScreen:
        return smoothEaseInOutPageRoute(ForgotPasswordOtpScreen());
      case Routes.resetPasswordScreen:
        return smoothEaseInOutPageRoute(ResetPasswordScreen());
      case Routes.registerScreen:
        return smoothEaseInOutPageRoute(RegisterScreen());
      case Routes.verifyEmailScreen:
        return smoothEaseInOutPageRoute(VerifyEmailScreen());
      case Routes.homeScreen:
        return smoothEaseInOutPageRoute(HomeScreen());
    }
    return null;
  }
}
