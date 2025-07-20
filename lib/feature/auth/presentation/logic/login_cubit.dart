import 'package:fitme/core/networking/api_result.dart';
import 'package:fitme/feature/auth/data/model/login_request_body.dart';
import 'package:fitme/feature/auth/data/model/login_response_model.dart';
import 'package:fitme/feature/auth/data/repository/auth_repository.dart';
import 'package:fitme/feature/auth/presentation/logic/login_state.dart';
import 'package:flutter/widgets.dart';
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
    if (response is Success<LoginResponseModel>) {
      emit(LoginSuccesState());
    } else if (response is Failure) {
      emit(LoginErrorState(message: response.toString()));
    }
  }
}
