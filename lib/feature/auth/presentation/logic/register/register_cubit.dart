import 'package:fitme/feature/auth/data/model/register/confirm_email_request_body.dart';
import 'package:fitme/feature/auth/data/model/register/register_request_body.dart';
import 'package:fitme/feature/auth/data/model/register/resend_confirm_email_request_body.dart';
import 'package:fitme/feature/auth/data/repository/auth_repository.dart';
import 'package:fitme/feature/auth/presentation/logic/register/register_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;
  RegisterCubit(this._authRepository) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpCodeController = TextEditingController();

  Future<void> register() async {
    emit(RegisterLoadingState());
    final result = await _authRepository.register(
      RegisterRequestBody(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    result.fold(
      (error) => emit(RegisterErrorState(message: error)),
      (data) => emit(RegisterSuccessState(email: emailController.text)),
    );
  }

  Future<void> confirmEmail({required String email}) async {
    emit(ConfirmEmailLoadingState());
    final result = await _authRepository.confirmEmail(
      ConfirmEmailRequestBody(email: email, code: otpCodeController.text),
    );

    result.fold(
      (error) => emit(ConfirmEmailErrorState(message: error)),
      (data) => emit(ConfirmEmailSuccessState()),
    );
  }

  Future<void> resendOTP({required String email}) async {
    emit(ResendOTPConfirmEmailLoadingState());
    final result = await _authRepository.resendConfirmEmail(
      ResendConfirmEmailRequestBody(email: email),
    );

    result.fold(
      (error) => emit(ResendOTPConfirmEmailErrorState(message: error)),
      (data) => emit(ResendOTPConfirmEmailSuccessState()),
    );
  }

  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    otpCodeController.dispose();
  }
}
