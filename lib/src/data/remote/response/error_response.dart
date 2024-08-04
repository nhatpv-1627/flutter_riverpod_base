import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ErrorResponse {
  @JsonKey(name: 'status_code')
  final int? statusCode;

  @JsonKey(name: 'status_message')
  final String? statusMessage;
  ErrorResponse({
    this.statusCode,
    this.statusMessage,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  @override
  String toString() =>
      'ErrorResponse(statusCode: $statusCode, statusMessage: $statusMessage)';
}
