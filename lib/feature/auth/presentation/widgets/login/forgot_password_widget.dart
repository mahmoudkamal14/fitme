import 'package:fitme/core/helper/utils/extentions.dart';
import 'package:fitme/core/routes/routes.dart';
import 'package:flutter/material.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            context.navigateTo(Routes.forgotPasswordScreen);
          },
          child: Text(
            'Forgot Password?',
            textAlign: TextAlign.end,
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: Color(0xFF638285)),
          ),
        ),
      ],
    );
  }
}
