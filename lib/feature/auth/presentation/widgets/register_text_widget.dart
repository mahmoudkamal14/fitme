import 'package:flutter/material.dart';

class RegisterTextWidget extends StatelessWidget {
  const RegisterTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'First time here? ',
          style: TextStyle(
            color: const Color(0xFF0F1314),
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Signup',
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
