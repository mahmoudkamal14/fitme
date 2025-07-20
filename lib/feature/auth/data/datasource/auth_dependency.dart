import 'package:dio/dio.dart';
import 'package:fitme/feature/auth/data/datasource/authentication_data_source.dart';
import 'package:fitme/feature/auth/data/repository/auth_repository.dart';
import 'package:fitme/feature/auth/presentation/logic/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void authDependency() {
  Dio dio = Dio();

  getIt.registerLazySingleton<AuthenticationDataSource>(
    () => AuthenticationDataSource(dio),
  );

  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
