abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {
  final String email;

  RegisterSuccessState({required this.email});
}

final class RegisterErrorState extends RegisterState {
  final String message;

  RegisterErrorState({required this.message});
}

final class ConfirmEmailLoadingState extends RegisterState {}

final class ConfirmEmailSuccessState extends RegisterState {}

final class ConfirmEmailErrorState extends RegisterState {
  final String message;

  ConfirmEmailErrorState({required this.message});
}

final class ResendOTPConfirmEmailLoadingState extends RegisterState {}

final class ResendOTPConfirmEmailSuccessState extends RegisterState {}

final class ResendOTPConfirmEmailErrorState extends RegisterState {
  final String message;

  ResendOTPConfirmEmailErrorState({required this.message});
}
