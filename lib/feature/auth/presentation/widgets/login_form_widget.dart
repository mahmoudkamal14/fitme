import 'package:fitme/core/widgets/app_text_form_field.dart';
import 'package:fitme/feature/auth/presentation/widgets/forgot_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          hintText: 'Email',
          prefixIcon: Icon(Icons.email_outlined),
        ),
        SizedBox(height: 20.h),
        AppTextFormField(
          hintText: 'Password',
          prefixIcon: Icon(Icons.lock_outline_rounded),
          suffixIcon: Icon(Icons.visibility),
        ),
        SizedBox(height: 20.h),
        ForgotPasswordWidget(),
        SizedBox(height: 30.h),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              /////
            },
            child: Text('Login'),
          ),
        ),
      ],
    );
  }
}
