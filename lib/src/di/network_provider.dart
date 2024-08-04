import 'package:flutter/foundation.dart';
import 'package:flutter_base/src/data/remote/api/auth_api.dart';
import 'package:flutter_base/src/data/remote/api/unauth_api.dart';
import 'package:flutter_base/src/data/remote/builder/dio_builder.dart';
import 'package:flutter_base/src/data/remote/middlewares/auth_interceptor.dart';
import 'package:flutter_base/src/data/remote/middlewares/common_interceptor.dart';
import 'package:flutter_base/src/di/local_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_provider.g.dart';

@Riverpod(keepAlive: true)
CommonInterceptor commonInterceptor(CommonInterceptorRef ref) {
  return CommonInterceptor();
}

@Riverpod(keepAlive: true)
PrettyDioLogger loggerInterceptor(LoggerInterceptorRef ref) {
  return PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  );
}

@Riverpod(keepAlive: true)
DioBuilder unAuthDioBuilder(UnAuthDioBuilderRef ref) {
  return DioBuilder.getInstance(
    interceptors: [
      ref.watch(commonInterceptorProvider),
      if (kDebugMode) ref.watch(loggerInterceptorProvider),
    ],
  );
}

@Riverpod(keepAlive: true)
AuthInterceptor authInterceptor(AuthInterceptorRef ref) {
  return AuthInterceptor(
    currentDio: ref.watch(unAuthDioBuilderProvider),
    secureStorage: ref.watch(secureStorageProvider).requireValue,
    unAuthApi: ref.watch(unAuthApiProvider),
  );
}

@Riverpod(keepAlive: true)
UnAuthApi unAuthApi(UnAuthApiRef ref) {
  return UnAuthApi(
    ref.watch(unAuthDioBuilderProvider),
  );
}

@Riverpod(keepAlive: true)
DioBuilder authDioBuilder(AuthDioBuilderRef ref) {
  return DioBuilder.getInstance(
    interceptors: [
      ref.watch(commonInterceptorProvider),
      ref.watch(authInterceptorProvider),
      if (kDebugMode) ref.watch(loggerInterceptorProvider),
    ],
  );
}

@Riverpod(keepAlive: true)
AuthApi authApi(AuthApiRef ref) {
  return AuthApi(
    ref.watch(authDioBuilderProvider),
  );
}
