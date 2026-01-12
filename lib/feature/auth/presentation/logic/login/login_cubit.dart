import 'package:fitme/core/cache/cache_helper.dart';
import 'package:fitme/core/cache/cache_helper_key.dart';
import 'package:fitme/feature/auth/data/model/login/login_request_body.dart';
import 'package:fitme/feature/auth/data/repository/auth_repository.dart';
import 'package:fitme/feature/auth/presentation/logic/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _repository;
  LoginCubit(this._repository) : super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  static LoginCubit get(context) => BlocProvider.of(context);

  // LoginResponseModel? userModel;

  Future<void> login() async {
    emit(LoginLoadingState());
    final response = await _repository.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.fold(
      (erroe) {
        emit(LoginErrorState(message: erroe));
      },
      (data) {
        saveToken(accessToken: data.token!, refreshToken: data.refreshToken!);
        emit(LoginSuccesState());
      },
    );
  }

  Future<void> saveToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    await CacheHelper().saveSecuredData(
      key: CacheHelperKey.accessToken,
      value: accessToken,
    );
    await CacheHelper().saveSecuredData(
      key: CacheHelperKey.refreshToken,
      value: refreshToken,
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginWithGoogleLoadingState());
    final response = await _repository.loginWithGoogle();

    response.fold(
      (erroe) {
        emit(LoginWithGoogleErrorState(message: erroe));
      },
      (data) {
        emit(LoginWithGoogleSuccesState());
      },
    );
  }
}
