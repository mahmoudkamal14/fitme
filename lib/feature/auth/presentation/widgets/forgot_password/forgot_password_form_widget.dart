import 'package:fitme/core/helper/function/validator.dart';
import 'package:fitme/core/widgets/app_text_form_field.dart';
import 'package:fitme/feature/auth/presentation/logic/forgot_password/forgot_password_cubit.dart';
import 'package:fitme/feature/auth/presentation/logic/forgot_password/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordFormWidget extends StatelessWidget {
  const ForgotPasswordFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    //TextEditingController emailController = TextEditingController();
    var cubit = ForgotPasswordCubit.get(context);
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
          SizedBox(height: 20),
          BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.forgotPassword();
                    }
                  },
                  child:
                      state is ForgotPasswordLoadingState
                          ? CircularProgressIndicator()
                          : Text(
                            'Send OTP',
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
