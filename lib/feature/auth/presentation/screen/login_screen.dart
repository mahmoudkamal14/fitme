import 'package:fitme/feature/auth/presentation/widgets/login_bloc_listener.dart';
import 'package:fitme/feature/auth/presentation/widgets/login_form_widget.dart';
import 'package:fitme/feature/auth/presentation/widgets/login_social_media_widget.dart';
import 'package:fitme/feature/auth/presentation/widgets/login_welcome_message_widget.dart';
import 'package:fitme/feature/auth/presentation/widgets/or_login_with_widget.dart';
import 'package:fitme/feature/auth/presentation/widgets/register_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginBlocListener(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                spacing: 30.h,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LoginWelcomeMessageWidget(),
                  LoginFormWidget(),
                  OrLoginWithWidget(),
                  LoginSocialMediaWidget(),
                  RegisterTextWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
