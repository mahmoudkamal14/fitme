import 'package:json_annotation/json_annotation.dart';

part 'resend_confirm_email_request_body.g.dart';

@JsonSerializable(createFactory: false)
class ResendConfirmEmailRequestBody {
  @JsonKey(name: 'Email')
  final String email;

  ResendConfirmEmailRequestBody({required this.email});

  Map<String, dynamic> toJson() => _$ResendConfirmEmailRequestBodyToJson(this);
}
