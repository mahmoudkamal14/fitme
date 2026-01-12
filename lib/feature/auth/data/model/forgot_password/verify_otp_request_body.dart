import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_request_body.g.dart';

@JsonSerializable(createFactory: false)
class VerifyOtpRequestBody {
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'Code')
  final String code;

  VerifyOtpRequestBody({required this.code, required this.email});

  Map<String, dynamic> toJson() => _$VerifyOtpRequestBodyToJson(this);
}
