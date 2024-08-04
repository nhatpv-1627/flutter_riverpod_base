import 'package:json_annotation/json_annotation.dart';

import 'data_model.dart';

part 'login_token.g.dart';

@JsonSerializable()
class Token with DataModel {
  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  Token({
    required this.accessToken,
    this.refreshToken,
  });

  Token copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return Token(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toJson() => _$TokenToJson(this);

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  @override
  String toString() =>
      'Token(accessToken: $accessToken, refreshToken: $refreshToken)';
}
