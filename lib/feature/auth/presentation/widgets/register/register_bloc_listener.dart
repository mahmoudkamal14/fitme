import 'package:fitme/core/helper/function/navigate_to.dart';
import 'package:fitme/core/helper/function/show_toast.dart';
import 'package:fitme/core/di/auth_dependency.dart';
import 'package:fitme/feature/auth/presentation/logic/register/register_cubit.dart';
import 'package:fitme/feature/auth/presentation/logic/register/register_state.dart';
import 'package:fitme/feature/auth/presentation/screen/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            navigateTo(context, screen: VerifyEmailScreen(email: state.email));
          } else if (state is RegisterErrorState) {
            showToast(msg: state.message, color: Colors.red);
          }
        },
        child: child,
      ),
    );
  }
}
