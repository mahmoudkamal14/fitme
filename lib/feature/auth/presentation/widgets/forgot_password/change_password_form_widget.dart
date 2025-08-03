import 'package:fitme/core/helper/function/validator.dart';
import 'package:fitme/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordFormWidget extends StatelessWidget {
  const ChangePasswordFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Enter New Password',
            prefixIcon: Icon(Icons.lock_outline_rounded),
            controller: newPasswordController,
            suffixIcon: Icon(Icons.visibility),
            validator: (value) => passwordValidator(value),
          ),
          SizedBox(height: 20.h),
          AppTextFormField(
            hintText: 'Confirm New Password',
            prefixIcon: Icon(Icons.lock_outline_rounded),
            controller: confirmPasswordController,
            suffixIcon: Icon(Icons.visibility),
            validator: (value) {
              if (value != newPasswordController.text) {
                return 'Passwords do not match';
              }
              return passwordValidator(value);
            },
          ),
          SizedBox(height: 30.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {}
              },
              child: Text(
                'Change',
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
