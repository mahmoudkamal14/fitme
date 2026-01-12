abstract class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ForgotPasswordLoadingState extends ForgotPasswordState {}

final class ForgotPasswordSuccessState extends ForgotPasswordState {}

final class ForgotPasswordErrorState extends ForgotPasswordState {
  final String message;

  ForgotPasswordErrorState({required this.message});
}

final class VerifyResetOtpLoadingState extends ForgotPasswordState {}

final class VerifyResetOtpSuccessState extends ForgotPasswordState {}

final class VerifyResetOtpErrorState extends ForgotPasswordState {
  final String message;

  VerifyResetOtpErrorState({required this.message});
}

final class ResetPasswordLoadingState extends ForgotPasswordState {}

final class ResetPasswordSuccessState extends ForgotPasswordState {}

final class ResetPasswordErrorState extends ForgotPasswordState {
  final String message;

  ResetPasswordErrorState({required this.message});
}
