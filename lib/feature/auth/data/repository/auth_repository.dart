import 'package:fitme/core/networking/api_result.dart';
import 'package:fitme/feature/auth/data/datasource/authentication_data_source.dart';
import 'package:fitme/feature/auth/data/model/login_request_body.dart';
import 'package:fitme/feature/auth/data/model/login_response_model.dart';

class AuthRepository {
  final AuthenticationDataSource _dataSource;

  AuthRepository(this._dataSource);

  Future<ApiResult<LoginResponseModel>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final result = await _dataSource.login(loginRequestBody);

      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
