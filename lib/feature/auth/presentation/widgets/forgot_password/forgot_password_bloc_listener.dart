import 'package:fitme/core/helper/function/navigate_to.dart';
import 'package:fitme/core/helper/function/show_toast.dart';
import 'package:fitme/core/di/auth_dependency.dart';
import 'package:fitme/feature/auth/presentation/logic/forgot_password/forgot_password_cubit.dart';
import 'package:fitme/feature/auth/presentation/logic/forgot_password/forgot_password_state.dart';
import 'package:fitme/feature/auth/presentation/screen/verify_otp_reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordBlocListener extends StatelessWidget {
  const ForgotPasswordBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgotPasswordCubit>(),
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        child: child,
        listener: (context, state) {
          var cubit = ForgotPasswordCubit.get(context);
          if (state is ForgotPasswordSuccessState) {
            showToast(
              msg: 'Verification code sent to your email',
              color: Colors.green,
            );
            navigateTo(
              context,
              screen: VerifyOtpResetPasswordScreen(
                email: cubit.emailController.text,
              ),
            );
          } else if (state is ForgotPasswordErrorState) {
            showToast(msg: state.message, color: Colors.red);
          }
        },
      ),
    );
  }
}
