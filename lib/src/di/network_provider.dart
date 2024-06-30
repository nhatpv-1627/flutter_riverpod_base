import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_base/src/data/remote/api/auth_api.dart';
import 'package:flutter_base/src/data/remote/api/unauth_api.dart';
import 'package:flutter_base/src/data/remote/builder/dio_builder.dart';
import 'package:flutter_base/src/data/remote/middlewares/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../data/remote/middlewares/common_interceptor.dart';

final commonInterceptor =
    Provider<CommonInterceptor>((ref) => CommonInterceptor());

final unAuthDioBuilderProvider = Provider<Dio>(
  (ref) => DioBuilder.getInstance(
    interceptors: [
      ref.watch(commonInterceptor),
      if (kDebugMode) ref.watch(loggerInterceptorProvider),
    ],
  ),
);

final loggerInterceptorProvider = Provider(
  (ref) => PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  ),
);

final unAuthApiProvider = Provider(
  (ref) => UnAuthApi(
    ref.watch(unAuthDioBuilderProvider),
  ),
);

final authInterceptor = Provider<AuthInterceptor>(
  (ref) => AuthInterceptor(
    currentDio: ref.watch(unAuthDioBuilderProvider),
  ),
);

final authDioBuilderProvider = Provider<Dio>(
  (ref) => DioBuilder.getInstance(
    interceptors: [
      ref.watch(commonInterceptor),
      ref.watch(authInterceptor),
      if (kDebugMode) ref.watch(loggerInterceptorProvider),
    ],
  ),
);

final authApiProvider = Provider(
  (ref) => AuthApi(
    ref.watch(authDioBuilderProvider),
  ),
);
