import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_base/src/data/remote/response/error_response.dart';

enum AppErrorType {
  network,
  badRequest,
  unauthorized,
  notFound,
  cancel,
  timeout,
  server,
  unknown,
}

class AppError implements Equatable {
  final String? message;
  final AppErrorType type;

  final int? errorCode;
  final List<ErrorResponse>? errors;

  AppError(this.type, this.message, {this.errorCode, this.errors});

  factory AppError.from(Object? exception) {
    var type = AppErrorType.unknown;
    String? message = '';
    int? code;
    List<ErrorResponse>? errs;
    if (exception is DioException) {
      message = exception.error.toString();
      code = exception.response?.statusCode ?? -1;

      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
          type = AppErrorType.timeout;
          break;
        case DioExceptionType.sendTimeout:
        case DioExceptionType.connectionError:
          type = AppErrorType.network;
          break;
        case DioExceptionType.badResponse:
          switch (exception.response?.statusCode) {
            case HttpStatus.unauthorized:
              type = AppErrorType.unauthorized;
              break;
            case HttpStatus.badRequest:
            case HttpStatus.notFound:
            case HttpStatus.methodNotAllowed:
            case HttpStatus.unprocessableEntity:
            case HttpStatus.internalServerError:
            case HttpStatus.badGateway:
            case HttpStatus.serviceUnavailable:
            case HttpStatus.gatewayTimeout:
              type = AppErrorType.server;
              try {
                final serverErr =
                    ErrorResponse.fromJson(exception.response?.data);
                errs = [serverErr];
              } catch (ex) {
                errs = [
                  ErrorResponse(statusCode: -1, statusMessage: ex.toString())
                ];
              }
              break;
            default:
              type = AppErrorType.unknown;
              break;
          }
          break;
        case DioExceptionType.cancel:
          type = AppErrorType.cancel;
          break;

        case DioExceptionType.unknown:
        default:
          if (exception.error is SocketException) {
            // SocketException: Failed host lookup: '***'
            // (OS Error: No address associated with hostname, errno = 7)
            type = AppErrorType.network;
          } else {
            type = AppErrorType.unknown;
          }
          break;
      }
    } else {
      code = -1;
      type = AppErrorType.unknown;
      message = 'AppError: $exception';
    }

    return AppError(type, message, errorCode: code, errors: errs);
  }

  @override
  List<Object?> get props => [type, message, errorCode, errors];

  @override
  bool? get stringify => true;
}
