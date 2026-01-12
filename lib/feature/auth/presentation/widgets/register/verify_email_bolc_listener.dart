import 'package:fitme/core/helper/function/show_toast.dart';
import 'package:fitme/core/helper/utils/extentions.dart';
import 'package:fitme/core/routes/routes.dart';
import 'package:fitme/core/di/auth_dependency.dart';
import 'package:fitme/feature/auth/presentation/logic/register/register_cubit.dart';
import 'package:fitme/feature/auth/presentation/logic/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailBolcListener extends StatelessWidget {
  const VerifyEmailBolcListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: BlocListener<RegisterCubit, RegisterState>(
        child: child,
        listener: (context, state) {
          if (state is ConfirmEmailSuccessState) {
            showToast(msg: 'Email verified successfully!', color: Colors.green);

            context.navigateAndRemoveUntil(Routes.loginScreen);
          } else if (state is ConfirmEmailErrorState) {
            showToast(msg: state.message, color: Colors.red);
          }
        },
      ),
    );
  }
}
