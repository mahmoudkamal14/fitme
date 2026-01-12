import 'package:dio/dio.dart';
import 'package:fitme/core/networking/api_client.dart';
import 'package:fitme/feature/auth/data/datasource/authentication_data_source.dart';
import 'package:fitme/feature/auth/data/repository/auth_repository.dart';
import 'package:fitme/feature/auth/presentation/logic/forgot_password/forgot_password_cubit.dart';
import 'package:fitme/feature/auth/presentation/logic/login/login_cubit.dart';
import 'package:fitme/feature/auth/presentation/logic/register/register_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void authDependency() {
  Dio dio = ApiClient().getDio();

  getIt.registerLazySingleton<AuthenticationDataSource>(
    () => AuthenticationDataSource(dio),
  );

  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerFactory<ForgotPasswordCubit>(
    () => ForgotPasswordCubit(getIt()),
  );
}
