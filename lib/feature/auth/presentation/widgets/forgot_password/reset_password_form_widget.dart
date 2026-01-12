import 'package:fitme/core/helper/function/validator.dart';
import 'package:fitme/core/widgets/app_text_form_field.dart';
import 'package:fitme/feature/auth/presentation/logic/forgot_password/forgot_password_cubit.dart';
import 'package:fitme/feature/auth/presentation/logic/forgot_password/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordFormWidget extends StatefulWidget {
  const ResetPasswordFormWidget({
    super.key,
    required this.email,
    required this.code,
  });

  final String email;
  final String code;

  @override
  State<ResetPasswordFormWidget> createState() =>
      _ResetPasswordFormWidgetState();
}

class _ResetPasswordFormWidgetState extends State<ResetPasswordFormWidget> {
  bool isObscureText = true;
  IconData visibilityIcon = Icons.visibility_off_outlined;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Enter New Password',
            prefixIcon: Icon(Icons.lock_outline_rounded),
            controller: newPasswordController,
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
          SizedBox(height: 20.h),
          AppTextFormField(
            hintText: 'Confirm New Password',
            prefixIcon: Icon(Icons.lock_outline_rounded),
            controller: confirmPasswordController,
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
            validator: (value) {
              if (value != newPasswordController.text) {
                return 'Passwords do not match';
              }
              return passwordValidator(value);
            },
          ),
          SizedBox(height: 30.h),
          BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ForgotPasswordCubit.get(context).resetPassword(
                        email: widget.email,
                        code: widget.code,
                        newPassword: newPasswordController.text,
                      );
                    }
                  },
                  child:
                      state is ResetPasswordLoadingState
                          ? CircularProgressIndicator()
                          : Text(
                            'Change',
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
