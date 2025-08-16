import 'package:fitme/app/fitme_app.dart';
import 'package:fitme/core/cache/cache_helper.dart';
import 'package:fitme/core/routes/app_router.dart';
import 'package:fitme/feature/auth/data/datasource/auth_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper().init();
  authDependency();

  await ScreenUtil.ensureScreenSize();
  runApp(FitmeApp(appRouter: AppRouter()));
}
