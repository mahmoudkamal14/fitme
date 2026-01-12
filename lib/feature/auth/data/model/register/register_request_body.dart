import 'package:json_annotation/json_annotation.dart';

part 'register_request_body.g.dart';

@JsonSerializable(createFactory: false)
class RegisterRequestBody {
  @JsonKey(name: 'FullName')
  final String name;
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'Password')
  final String password;

  RegisterRequestBody({
    required this.email,
    required this.password,
    required this.name,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
