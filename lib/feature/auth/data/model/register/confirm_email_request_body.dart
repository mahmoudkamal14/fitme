import 'package:json_annotation/json_annotation.dart';

part 'confirm_email_request_body.g.dart';

@JsonSerializable(createFactory: false)
class ConfirmEmailRequestBody {
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'Code')
  final String code;

  ConfirmEmailRequestBody({required this.email, required this.code});

  Map<String, dynamic> toJson() => _$ConfirmEmailRequestBodyToJson(this);
}
