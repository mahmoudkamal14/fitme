import 'package:fitme/core/helper/function/validator.dart';
import 'package:fitme/core/widgets/app_text_form_field.dart';
import 'package:fitme/feature/auth/presentation/logic/register/register_cubit.dart';
import 'package:fitme/feature/auth/presentation/logic/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  bool isObscureText = true;
  IconData visibilityIcon = Icons.visibility_off_outlined;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    var cubit = RegisterCubit.get(context);
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            prefixIcon: Icon(Icons.person_outline),
            controller: cubit.nameController,
            validator: (value) => validateName(value),
          ),
          SizedBox(height: 20.h),
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
            controller: cubit.passwordController,
            isObscureText: isObscureText,
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
          SizedBox(height: 30.h),
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.register();
                    }
                  },
                  child:
                      state is RegisterLoadingState
                          ? CircularProgressIndicator()
                          : Text(
                            'Register',
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
