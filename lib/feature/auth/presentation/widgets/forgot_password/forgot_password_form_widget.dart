import 'package:fitme/core/helper/function/validator.dart';
import 'package:fitme/core/helper/utils/extentions.dart';
import 'package:fitme/core/routes/routes.dart';
import 'package:fitme/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordFormWidget extends StatelessWidget {
  const ForgotPasswordFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'user26@gmail.com',
            prefixIcon: Icon(Icons.email_outlined),
            validator: (value) => validateEmail(value),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.navigateTo(Routes.forgotPasswordOTPScreen);
              },
              child: Text(
                'Send OTP',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
