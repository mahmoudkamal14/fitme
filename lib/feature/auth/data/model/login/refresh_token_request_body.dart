import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_request_body.g.dart';

@JsonSerializable(createFactory: false)
class RefreshTokenRequestBody {
  @JsonKey(name: 'RefreshToken')
  final String refreshToken;
  @JsonKey(name: 'Token')
  final String accessToken;

  RefreshTokenRequestBody({
    required this.refreshToken,
    required this.accessToken,
  });

  Map<String, dynamic> toJson() => _$RefreshTokenRequestBodyToJson(this);
}
