import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color(0xFF638285),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    actionsIconTheme: const IconThemeData(color: Color(0xFF0F1314)),
    iconTheme: const IconThemeData(color: Color(0xFF0F1314)),
    titleTextStyle: TextStyle(
      color: Color(0xFF0F1314),
      fontSize: 22.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      height: 0,
    ),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: const Color(0xFF0F1314),
      fontSize: 28.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      height: 0,
    ),
    titleMedium: TextStyle(
      color: const Color(0xFF0F1314),
      fontSize: 24.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      height: 0,
    ),
    titleSmall: TextStyle(
      color: const Color(0xFF9F9D9A),
      fontSize: 18.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      height: 0,
    ),
    bodyLarge: TextStyle(
      color: const Color(0xFF0F1314),
      fontSize: 24.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      height: 0,
    ),
    bodyMedium: TextStyle(
      color: const Color(0xFF0F1314),
      fontSize: 20.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      height: 0,
    ),
    bodySmall: TextStyle(
      color: const Color(0xFF9F9D9A),
      fontSize: 16.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      height: 0,
    ),
  ),
  useMaterial3: false,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: const Color(0xFF103A69),
    selectedIconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
    unselectedIconTheme: const IconThemeData(color: Color(0xFF6A6A6C)),
    selectedLabelStyle: TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      height: 1.2.h,
    ),
    // unselectedLabelStyle: TextStyle(
    //   color: const Color(0xFFB0C4DE),
    //   fontSize: 13.sp,
    //   fontWeight: FontWeight.w400,
    //   height: 1.2,
    // ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(const Color(0xFF103A69)),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      overlayColor: WidgetStateProperty.all(const Color(0xFF082A4F)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
      ),
    ),
  ),
  iconTheme: const IconThemeData(color: Color(0xFF2C2C2E)),
  hoverColor: const Color(0xFF103A69),
  cardColor: Colors.white,
  canvasColor: const Color(0xffD85E2C),
  dividerColor: const Color(0xFF103A69),
  hintColor: Colors.black,
  secondaryHeaderColor: const Color(0xffFFFEEE),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: const Color(0xFF2C2C2E), width: 1.3.w),
      borderRadius: BorderRadius.circular(16),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: const Color(0xFF2C2C2E), width: 1.3.w),
      borderRadius: BorderRadius.circular(16),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 1.3.w),
      borderRadius: BorderRadius.circular(16),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 1.3.w),
      borderRadius: BorderRadius.circular(16),
    ),
  ),
);
