abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccesState extends LoginState {}

final class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState({required this.message});
}
