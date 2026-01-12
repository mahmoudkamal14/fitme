import 'package:fitme/core/helper/function/validator.dart';
import 'package:fitme/core/widgets/app_text_form_field.dart';
import 'package:fitme/feature/auth/presentation/logic/login/login_cubit.dart';
import 'package:fitme/feature/auth/presentation/logic/login/login_state.dart';
import 'package:fitme/feature/auth/presentation/widgets/login/forgot_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  bool isObscureText = true;
  IconData visibilityIcon = Icons.visibility_off_outlined;
  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    GlobalKey<FormState> formKey = GlobalKey();

    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            prefixIcon: Icon(Icons.email_outlined),
            controller: cubit.emailController,
            validator: (value) => validateEmail(value),
          ),
          SizedBox(height: 20.h),
          AppTextFormField(
            hintText: 'Password',
            prefixIcon: Icon(Icons.lock_outline_rounded),
            isObscureText: isObscureText,
            controller: cubit.passwordController,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              icon: Icon(
                isObscureText == true ? visibilityIcon : Icons.visibility,
              ),
            ),
            validator: (value) => passwordValidator(value),
          ),
          SizedBox(height: 20.h),
          ForgotPasswordWidget(),
          SizedBox(height: 30.h),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.login();
                    }
                  },
                  child:
                      state is LoginLoadingState
                          ? CircularProgressIndicator()
                          : Text(
                            'Login',
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(color: Colors.white),
                          ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
