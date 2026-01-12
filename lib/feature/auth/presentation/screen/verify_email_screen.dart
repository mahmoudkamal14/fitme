import 'package:fitme/core/helper/utils/extentions.dart';
import 'package:fitme/feature/auth/presentation/logic/register/register_cubit.dart';
import 'package:fitme/feature/auth/presentation/logic/register/register_state.dart';
import 'package:fitme/feature/auth/presentation/widgets/pin_code_verification.dart';
import 'package:fitme/feature/auth/presentation/widgets/register/verify_email_bolc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return VerifyEmailBolcListener(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Verify Email'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => context.pop(),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
              child: Column(
                spacing: 22.h,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/Verification_Code.svg',
                    alignment: AlignmentDirectional.center,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    'We have sent a verification code to your email. Please enter the code below to verify your email address.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      var otpCodeController =
                          RegisterCubit.get(context).otpCodeController;

                      return PinCodeVerification(
                        otpCodeController: otpCodeController,
                        isLoading:
                            state is ConfirmEmailLoadingState ? true : false,
                        verifyOTP: () {
                          RegisterCubit.get(context).confirmEmail(email: email);
                        },
                        resendOTP: () {
                          RegisterCubit.get(context).resendOTP(email: email);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
