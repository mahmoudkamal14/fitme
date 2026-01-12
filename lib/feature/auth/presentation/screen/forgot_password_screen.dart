import 'package:fitme/core/helper/utils/extentions.dart';
import 'package:fitme/feature/auth/presentation/widgets/forgot_password/forgot_password_bloc_listener.dart';
import 'package:fitme/feature/auth/presentation/widgets/forgot_password/forgot_password_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordBlocListener(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Forgot Password'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => context.pop(),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
              child: Column(
                spacing: 22.h,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/Forgot_Password.svg',
                    alignment: AlignmentDirectional.center,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    'Enter your email to receive a one-time password (OTP) for resetting your password',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const ForgotPasswordFormWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
