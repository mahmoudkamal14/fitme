import 'package:fitme/app/fitme_app.dart';
import 'package:fitme/core/cache/cache_helper.dart';
import 'package:fitme/core/routes/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(FitmeApp(appRouter: AppRouter()));
}
