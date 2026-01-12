import 'package:json_annotation/json_annotation.dart';

part 'login_google_request_body.g.dart';

@JsonSerializable(createFactory: false)
class LoginGoogleRequestBody {
  @JsonKey(name: 'IdToken')
  final String idToken;

  LoginGoogleRequestBody({required this.idToken});

  Map<String, dynamic> toJson() => _$LoginGoogleRequestBodyToJson(this);
}
