import 'package:fitme/app/logic/app_cubit.dart';
import 'package:fitme/app/logic/app_state.dart';
import 'package:fitme/core/routes/app_router.dart';
import 'package:fitme/core/routes/routes.dart';
import 'package:fitme/core/theme/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FitmeApp extends StatelessWidget {
  const FitmeApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: MediaQuery.sizeOf(context),
            minTextAdapt: true,
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: Routes.onBoardingScreen,
                onGenerateRoute: appRouter.onGenerateRoute,
                theme: lightTheme,
                darkTheme: lightTheme,
                themeMode: AppCubit.get(context).getThemeMode(),
              );
            },
          );
        },
      ),
    );
  }
}
