class ApiConstants {
  static const String baseUrl = 'https://fitme1.runasp.net';
  // Authentication endpoints
  static const String login = '/Auth';
  static const String loginWithGoogle = '/Auth/google';
  static const String register = '/Auth/register';
  static const String confirmEmail = '/Auth/confirm-email';
  static const String resendConfirmEmail = '/Auth/resend-confirmation-email';
  static const String forgetPassword = '/Auth/forget-password';
  static const String verifyResetOtp = '/Auth/verify-reset-otp';
  static const String resetPassword = '/Auth/reset-password';
  static const String refreshToken = '/Auth/refresh';
  static const String logout = '/Auth/revoke-refresh-token';
}
