import 'package:fitme/core/cache/cache_helper.dart';
import 'package:fitme/core/cache/cache_helper_key.dart';
import 'package:fitme/core/helper/function/navigate_to.dart';
import 'package:fitme/core/helper/function/show_toast.dart';
import 'package:fitme/core/helper/utils/extentions.dart';
import 'package:fitme/core/networking/error_messages.dart';
import 'package:fitme/core/routes/routes.dart';
import 'package:fitme/core/di/auth_dependency.dart';
import 'package:fitme/feature/auth/presentation/logic/login/login_cubit.dart';
import 'package:fitme/feature/auth/presentation/logic/login/login_state.dart';
import 'package:fitme/feature/auth/presentation/screen/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          var email = LoginCubit.get(context).emailController.text;
          if (state is LoginSuccesState) {
            context.navigateAndRemoveUntil(Routes.navBarScreen);
            showToast(msg: 'Logged in successfully', color: Colors.green);
            // Save login status
            CacheHelper().saveData(key: CacheHelperKey.isLoggedIn, value: true);
          } else if (state is LoginErrorState) {
            showToast(msg: state.message, color: Colors.red);
            if (state.message ==
                errorMessages('Please confirm your email before logging in.')) {
              navigateTo(context, screen: VerifyEmailScreen(email: email));
            }
          }
        },
        child: child,
      ),
    );
  }
}
