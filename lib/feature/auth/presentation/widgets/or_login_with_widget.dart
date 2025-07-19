import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrLoginWithWidget extends StatelessWidget {
  const OrLoginWithWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(height: 1, color: Color(0xFF638285))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Or login with',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF0F1314),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(child: Divider(height: 1, color: Color(0xFF638285))),
      ],
    );
  }
}
