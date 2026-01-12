import 'package:fitme/core/helper/utils/extentions.dart';
import 'package:fitme/feature/auth/presentation/logic/forgot_password/forgot_password_cubit.dart';
import 'package:fitme/feature/auth/presentation/logic/forgot_password/forgot_password_state.dart';
import 'package:fitme/feature/auth/presentation/widgets/forgot_password/verify_otp_bloc_listener.dart';
import 'package:fitme/feature/auth/presentation/widgets/pin_code_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class VerifyOtpResetPasswordScreen extends StatelessWidget {
  const VerifyOtpResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return VerifyOtpBlocListener(
      email: email,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Verification Code'),
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
                    'We have sent a verification code to your email. Please enter the code below to verify your identity and reset your password.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                    builder: (context, state) {
                      var cubit = ForgotPasswordCubit.get(context);

                      return PinCodeVerification(
                        isLoading:
                            state is VerifyResetOtpLoadingState ? true : false,
                        otpCodeController: cubit.otpCodeController,
                        verifyOTP: () {
                          cubit.verifyResetOtp(email);
                        },
                        resendOTP: () {
                          cubit.forgotPassword();
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
