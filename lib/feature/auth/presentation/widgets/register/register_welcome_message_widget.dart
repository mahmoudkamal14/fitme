import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RegisterWelcomeMessageWidget extends StatelessWidget {
  const RegisterWelcomeMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SvgPicture.asset('assets/images/Logo.svg')],
          ),
        ),
        Text(
          'Create New Account',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 5.h),
        Text(
          'Looks like you don’t have an account \nor connect with social networks',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
