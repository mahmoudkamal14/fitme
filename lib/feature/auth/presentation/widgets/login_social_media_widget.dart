import 'package:fitme/feature/auth/presentation/logic/login/login_cubit.dart';
import 'package:fitme/feature/auth/presentation/widgets/custom_social_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginSocialMediaWidget extends StatelessWidget {
  const LoginSocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSocialWidget(
          imagePath: 'assets/icons/google.svg',
          text: 'Login with Google',
          onTap: () {
            // Implement Google login functionality here
            print('Google login tapped');
            LoginCubit.get(context).loginWithGoogle();
          },
        ),
        SizedBox(height: 10.h),
        CustomSocialWidget(
          imagePath: 'assets/icons/facebook.svg',
          text: 'Login with Facebook',
          onTap: () {},
        ),
      ],
    );
  }
}
