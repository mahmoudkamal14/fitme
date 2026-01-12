import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fitme/core/networking/api_error_handler.dart';
import 'package:fitme/core/networking/error_messages.dart';
import 'package:fitme/feature/auth/data/datasource/authentication_data_source.dart';
import 'package:fitme/feature/auth/data/model/forgot_password/forgot_password_request_body.dart';
import 'package:fitme/feature/auth/data/model/forgot_password/reset_password_request_body.dart';
import 'package:fitme/feature/auth/data/model/forgot_password/verify_otp_request_body.dart';
import 'package:fitme/feature/auth/data/model/login/login_google_request_body.dart';
import 'package:fitme/feature/auth/data/model/login/login_request_body.dart';
import 'package:fitme/feature/auth/data/model/login/auth_response_model.dart';
import 'package:fitme/feature/auth/data/model/register/confirm_email_request_body.dart';
import 'package:fitme/feature/auth/data/model/register/register_request_body.dart';
import 'package:fitme/feature/auth/data/model/register/resend_confirm_email_request_body.dart';

class AuthRepository {
  final AuthenticationDataSource _dataSource;

  AuthRepository(this._dataSource);

  Future<Either<String, AuthResponseModel>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final result = await _dataSource.login(loginRequestBody);

      return Right(result);
    } catch (e) {
      final errorMessage = errorMessages(ApiErrorHandler.handleError(e));
      return Left(errorMessage);
    }
  }

  Future<Either<String, void>> register(
    RegisterRequestBody registerRequestBody,
  ) async {
    try {
      FormData formData = FormData.fromMap({
        'FullName': registerRequestBody.name,
        'Email': registerRequestBody.email,
        'Password': registerRequestBody.password,
      });

      final result = await _dataSource.register(formData);

      return Right(result);
    } catch (e) {
      final errorMessage = errorMessages(ApiErrorHandler.handleError(e));

      return Left(errorMessage);
    }
  }

  Future<Either<String, void>> confirmEmail(
    ConfirmEmailRequestBody confirmEmailRequestBody,
  ) async {
    try {
      final result = await _dataSource.confirmEmail(confirmEmailRequestBody);

      return Right(result);
    } catch (e) {
      final errorMessage = errorMessages(ApiErrorHandler.handleError(e));

      return Left(errorMessage);
    }
  }

  Future<Either<String, void>> resendConfirmEmail(
    ResendConfirmEmailRequestBody resendConfirmEmailRequestBody,
  ) async {
    try {
      final result = await _dataSource.resendConfirmEmail(
        resendConfirmEmailRequestBody,
      );

      return Right(result);
    } catch (e) {
      final errorMessage = errorMessages(ApiErrorHandler.handleError(e));

      return Left(errorMessage);
    }
  }

  Future<Either<String, void>> forgotPassword(
    ForgotPasswordRequestBody forgotPasswordRequestBody,
  ) async {
    try {
      final result = await _dataSource.forgotPassword(
        forgotPasswordRequestBody,
      );

      return Right(result);
    } catch (e) {
      final errorMessage = errorMessages(ApiErrorHandler.handleError(e));

      return Left(errorMessage);
    }
  }

  Future<Either<String, void>> verifyResetOtp(
    VerifyOtpRequestBody verifyOtpRequestBody,
  ) async {
    try {
      final result = await _dataSource.verifyResetOtp(verifyOtpRequestBody);

      return Right(result);
    } catch (e) {
      final errorMessage = errorMessages(ApiErrorHandler.handleError(e));

      return Left(errorMessage);
    }
  }

  Future<Either<String, void>> resetPassword(
    ResetPasswordRequestBody resetPasswordRequestBody,
  ) async {
    try {
      final result = await _dataSource.resetPassword(resetPasswordRequestBody);

      return Right(result);
    } catch (e) {
      final errorMessage = errorMessages(ApiErrorHandler.handleError(e));

      return Left(errorMessage);
    }
  }

  Future<Either<String, AuthResponseModel>> loginWithGoogle() async {
    try {
      log('بدء عملية تسجيل الدخول بـ Google');

      GoogleSignIn? _googleSignIn = GoogleSignIn();

      // الخطوة 1: فتح نافذة تسجيل الدخول
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        log('المستخدم ألغى تسجيل الدخول');
        return const Left('تم إلغاء تسجيل الدخول');
      }

      log('تم تسجيل الدخول: ${googleUser.email}');

      // الخطوة 2: الحصول على التوكن
      final GoogleSignInAuthentication auth = await googleUser.authentication;

      if (auth.idToken == null) {
        log('فشل في الحصول على التوكن');
        return const Left('فشل في الحصول على معلومات التوثيق');
      }

      log('تم الحصول على التوكن بنجاح');

      // الخطوة 3: إرسال التوكن للسيرفر
      final loginGoogleRequestBody = LoginGoogleRequestBody(
        idToken: auth.idToken!,
      );

      final AuthResponseModel result = await _dataSource.loginWithGoogle(
        loginGoogleRequestBody,
      );

      log('تم تسجيل الدخول بنجاح');
      return Right(result);
    } catch (e) {
      log('خطأ في تسجيل الدخول: $e');
      final errorMessage = errorMessages(ApiErrorHandler.handleError(e));
      return Left(errorMessage);
    }
  }
}
