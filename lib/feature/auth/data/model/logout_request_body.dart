import 'package:json_annotation/json_annotation.dart';

part 'logout_request_body.g.dart';

@JsonSerializable(createFactory: false)
class LogoutRequestBody {
  @JsonKey(name: 'RefreshToken')
  final String refreshToken;
  @JsonKey(name: 'Token')
  final String accessToken;

  LogoutRequestBody({required this.refreshToken, required this.accessToken});

  Map<String, dynamic> toJson() => _$LogoutRequestBodyToJson(this);
}
