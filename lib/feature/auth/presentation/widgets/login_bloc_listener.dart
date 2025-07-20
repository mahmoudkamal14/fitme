import 'package:fitme/core/helper/utils/extentions.dart';
import 'package:fitme/core/routes/routes.dart';
import 'package:fitme/feature/auth/data/datasource/auth_dependency.dart';
import 'package:fitme/feature/auth/presentation/logic/login_cubit.dart';
import 'package:fitme/feature/auth/presentation/logic/login_state.dart';
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
          if (state is LoginSuccesState) {
            context.navigateAndReplace(Routes.homeScreen);
          }
        },
        child: child,
      ),
    );
  }
}
