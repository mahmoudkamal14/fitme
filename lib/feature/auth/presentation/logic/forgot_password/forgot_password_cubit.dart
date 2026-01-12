import 'package:fitme/feature/auth/data/model/forgot_password/forgot_password_request_body.dart';
import 'package:fitme/feature/auth/data/model/forgot_password/reset_password_request_body.dart';
import 'package:fitme/feature/auth/data/model/forgot_password/verify_otp_request_body.dart';
import 'package:fitme/feature/auth/data/repository/auth_repository.dart';
import 'package:fitme/feature/auth/presentation/logic/forgot_password/forgot_password_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository _authRepository;
  ForgotPasswordCubit(this._authRepository) : super(ForgotPasswordInitial());

  static ForgotPasswordCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController otpCodeController = TextEditingController();

  Future<void> forgotPassword() async {
    emit(ForgotPasswordLoadingState());
    final result = await _authRepository.forgotPassword(
      ForgotPasswordRequestBody(email: emailController.text),
    );

    result.fold(
      (error) => emit(ForgotPasswordErrorState(message: error)),
      (data) => emit(ForgotPasswordSuccessState()),
    );
  }

  Future<void> verifyResetOtp(String email) async {
    emit(VerifyResetOtpLoadingState());
    final result = await _authRepository.verifyResetOtp(
      VerifyOtpRequestBody(email: email, code: otpCodeController.text),
    );

    result.fold(
      (error) => emit(VerifyResetOtpErrorState(message: error)),
      (data) => emit(VerifyResetOtpSuccessState()),
    );
  }

  Future<void> resetPassword({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    emit(ResetPasswordLoadingState());
    final result = await _authRepository.resetPassword(
      ResetPasswordRequestBody(
        email: email,
        code: code,
        newPassword: newPassword,
      ),
    );

    result.fold(
      (error) => emit(ResetPasswordErrorState(message: error)),
      (data) => emit(ResetPasswordSuccessState()),
    );
  }
}
