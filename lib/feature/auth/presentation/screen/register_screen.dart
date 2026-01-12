import 'package:fitme/feature/auth/presentation/widgets/register/login_text_widget.dart';
import 'package:fitme/feature/auth/presentation/widgets/register/register_bloc_listener.dart';
import 'package:fitme/feature/auth/presentation/widgets/register/register_form_widget.dart';
import 'package:fitme/feature/auth/presentation/widgets/register/register_welcome_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RegisterBlocListener(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                spacing: 30.h,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RegisterWelcomeMessageWidget(),
                  RegisterFormWidget(),
                  // OrLoginWithWidget(),
                  // LoginSocialMediaWidget(),
                  LoginTextWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
