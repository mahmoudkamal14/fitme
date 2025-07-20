import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponseModel {
  final String? name;
  final String? id;
  final String? email;
  final String? token;
  final String? expiresIn;
  final String? refreshToken;
  final String? refreshTokenExpiration;

  LoginResponseModel({
    required this.name,
    required this.id,
    required this.email,
    required this.token,
    required this.expiresIn,
    required this.refreshToken,
    required this.refreshTokenExpiration,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
