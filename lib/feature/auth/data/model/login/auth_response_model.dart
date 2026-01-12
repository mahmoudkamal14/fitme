import 'package:json_annotation/json_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable(createToJson: false)
class AuthResponseModel {
  final String? userName;
  final String? id;
  final String? email;
  final String? token;
  final int? expiresIn;
  final String? refreshToken;
  final String? refreshTokenExpiration;

  AuthResponseModel({
    required this.userName,
    required this.id,
    required this.email,
    required this.token,
    required this.expiresIn,
    required this.refreshToken,
    required this.refreshTokenExpiration,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}
