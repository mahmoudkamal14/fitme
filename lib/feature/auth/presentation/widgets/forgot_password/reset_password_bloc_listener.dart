import 'package:fitme/core/helper/function/show_toast.dart';
import 'package:fitme/core/helper/utils/extentions.dart';
import 'package:fitme/core/routes/routes.dart';
import 'package:fitme/core/di/auth_dependency.dart';
import 'package:fitme/feature/auth/presentation/logic/forgot_password/forgot_password_cubit.dart';
import 'package:fitme/feature/auth/presentation/logic/forgot_password/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordBlocListener extends StatelessWidget {
  const ResetPasswordBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgotPasswordCubit>(),
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        child: child,
        listener: (context, state) {
          if (state is ResetPasswordSuccessState) {
            showToast(
              msg: 'Your password has been reset. You can now log in',
              color: Colors.green,
            );
            context.navigateAndRemoveUntil(Routes.loginScreen);
          } else if (state is ResetPasswordErrorState) {
            showToast(msg: state.message, color: Colors.red);
          }
        },
      ),
    );
  }
}
