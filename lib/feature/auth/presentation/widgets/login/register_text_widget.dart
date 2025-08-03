import 'package:fitme/core/helper/utils/extentions.dart';
import 'package:fitme/core/routes/routes.dart';
import 'package:flutter/material.dart';

class RegisterTextWidget extends StatelessWidget {
  const RegisterTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'First time here?',
          style: TextStyle(
            color: const Color(0xFF0F1314),
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: () {
            context.navigateTo(Routes.registerScreen);
          },
          child: Text(
            'Register',
            style: TextStyle(
              color: const Color(0xFF638285),
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
