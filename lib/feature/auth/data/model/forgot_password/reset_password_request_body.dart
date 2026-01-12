import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request_body.g.dart';

@JsonSerializable(createFactory: false)
class ResetPasswordRequestBody {
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'Code')
  final String code;
  final String newPassword;

  ResetPasswordRequestBody({
    required this.email,
    required this.newPassword,
    required this.code,
  });

  Map<String, dynamic> toJson() => _$ResetPasswordRequestBodyToJson(this);
}
