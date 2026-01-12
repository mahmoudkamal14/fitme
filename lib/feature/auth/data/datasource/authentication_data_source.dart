import 'package:dio/dio.dart';
import 'package:fitme/core/networking/api_constants.dart';
import 'package:fitme/feature/auth/data/model/forgot_password/forgot_password_request_body.dart';
import 'package:fitme/feature/auth/data/model/forgot_password/reset_password_request_body.dart';
import 'package:fitme/feature/auth/data/model/forgot_password/verify_otp_request_body.dart';
import 'package:fitme/feature/auth/data/model/login/login_google_request_body.dart';
import 'package:fitme/feature/auth/data/model/login/refresh_token_request_body.dart';
import 'package:fitme/feature/auth/data/model/register/confirm_email_request_body.dart';
import 'package:fitme/feature/auth/data/model/login/login_request_body.dart';
import 'package:fitme/feature/auth/data/model/login/auth_response_model.dart';
import 'package:fitme/feature/auth/data/model/register/resend_confirm_email_request_body.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthenticationDataSource {
  factory AuthenticationDataSource(Dio dio) = _AuthenticationDataSource;

  @POST(ApiConstants.login)
  Future<AuthResponseModel> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.loginWithGoogle)
  Future<AuthResponseModel> loginWithGoogle(
    @Body() LoginGoogleRequestBody loginGoogleRequestBody,
  );

  @POST(ApiConstants.register)
  Future<void> register(@Body() FormData formData);

  @POST(ApiConstants.confirmEmail)
  Future<void> confirmEmail(
    @Body() ConfirmEmailRequestBody confirmEmailRequestBody,
  );

  @POST(ApiConstants.resendConfirmEmail)
  Future<void> resendConfirmEmail(
    @Body() ResendConfirmEmailRequestBody resendConfirmEmailRequestBody,
  );

  @POST(ApiConstants.forgetPassword)
  Future<void> forgotPassword(
    @Body() ForgotPasswordRequestBody forgotPasswordRequestBody,
  );

  @POST(ApiConstants.verifyResetOtp)
  Future<void> verifyResetOtp(
    @Body() VerifyOtpRequestBody verifyOtpRequestBody,
  );

  @POST(ApiConstants.resetPassword)
  Future<void> resetPassword(
    @Body() ResetPasswordRequestBody resetPasswordRequestBody,
  );

  @POST(ApiConstants.refreshToken)
  Future<AuthResponseModel> refreshToken(
    @Body() RefreshTokenRequestBody refreshTokenRequestBody,
  );
}
