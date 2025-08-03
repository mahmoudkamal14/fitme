import 'package:fitme/core/helper/utils/extentions.dart';
import 'package:fitme/core/routes/routes.dart';
import 'package:fitme/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            prefixIcon: Icon(Icons.person_outline),
            validator: (val) {
              if (val!.isEmpty) {
                return 'Name is required';
              }
            },
          ),
          SizedBox(height: 20.h),
          AppTextFormField(
            hintText: 'Email',
            prefixIcon: Icon(Icons.email_outlined),
            validator: (val) {
              if (val!.isEmpty) {
                return 'Email is required';
              }
            },
          ),
          SizedBox(height: 20.h),
          AppTextFormField(
            hintText: 'Password',
            prefixIcon: Icon(Icons.lock_outline_rounded),
            suffixIcon: GestureDetector(
              onTap: () {},
              child: Icon(Icons.visibility),
            ),
            validator: (val) {
              if (val!.isEmpty) {
                return 'Password is required';
              }
            },
          ),
          SizedBox(height: 30.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // if (formKey.currentState!.validate()) {}
                context.navigateTo(Routes.verifyEmailScreen);
              },
              child: Text(
                'Register',
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
