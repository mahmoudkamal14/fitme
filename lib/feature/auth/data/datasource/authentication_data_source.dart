import 'package:dio/dio.dart';
import 'package:fitme/core/networking/api_constants.dart';
import 'package:fitme/feature/auth/data/model/login_request_body.dart';
import 'package:fitme/feature/auth/data/model/login_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthenticationDataSource {
  factory AuthenticationDataSource(Dio dio) = _AuthenticationDataSource;

  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(@Body() LoginRequestBody loginRequestBody);
}
