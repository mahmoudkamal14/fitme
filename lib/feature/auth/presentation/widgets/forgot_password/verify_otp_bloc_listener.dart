import 'dart:developer';

import 'package:fitme/core/helper/function/navigate_to.dart';
import 'package:fitme/core/helper/function/show_toast.dart';
import 'package:fitme/core/di/auth_dependency.dart';
import 'package:fitme/feature/auth/presentation/logic/forgot_password/forgot_password_cubit.dart';
import 'package:fitme/feature/auth/presentation/logic/forgot_password/forgot_password_state.dart';
import 'package:fitme/feature/auth/presentation/screen/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyOtpBlocListener extends StatelessWidget {
  const VerifyOtpBlocListener({
    super.key,
    required this.email,
    required this.child,
  });

  final String email;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgotPasswordCubit>(),
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        child: child,
        listener: (context, state) {
          var cubit = ForgotPasswordCubit.get(context);
          if (state is VerifyResetOtpSuccessState) {
            navigateTo(
              context,
              screen: ResetPasswordScreen(
                email: email,
                code: cubit.otpCodeController.text,
              ),
            );
          } else if (state is VerifyResetOtpErrorState) {
            showToast(msg: state.message, color: Colors.red);
          } else if (state is ForgotPasswordSuccessState) {
            showToast(
              msg: 'Verification code sent to your email',
              color: Colors.green,
            );
          } else if (state is ForgotPasswordErrorState) {
            log(state.message);
            showToast(msg: state.message, color: Colors.red);
          }
        },
      ),
    );
  }
}
