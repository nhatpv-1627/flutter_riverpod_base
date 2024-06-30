import 'package:freezed_annotation/freezed_annotation.dart';
import 'data_model.dart';

part 'login_token.freezed.dart';
part 'login_token.g.dart';

@freezed
class Token with _$Token, DataModel {
  const factory Token({
    @JsonKey(name: 'access_token') final String? accessToken,
    @JsonKey(name: 'refresh_token') final bool? refreshToken,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
