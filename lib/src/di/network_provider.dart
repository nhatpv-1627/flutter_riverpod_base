import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_base/src/data/remote/api/auth_api.dart';
import 'package:flutter_base/src/data/remote/api/unauth_api.dart';
import 'package:flutter_base/src/data/remote/builder/dio_builder.dart';
import 'package:flutter_base/src/data/remote/middlewares/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/remote/middlewares/common_interceptor.dart';

final commonInterceptor =
    Provider<CommonInterceptor>((ref) => CommonInterceptor());

final unauthDioBuilderProvider =
    Provider<Dio>((ref) => DioBuilder.getInstance(interceptors: [
          ref.watch(commonInterceptor),
          if (kDebugMode) LogInterceptor(responseBody: true, requestBody: true),
        ]));

final unauthApiProvider =
    Provider((ref) => UnAuthApi(ref.watch(unauthDioBuilderProvider)));

final authInterceptor = Provider<AuthInterceptor>(
    (ref) => AuthInterceptor(currentDio: ref.watch(unauthDioBuilderProvider)));

final authDioBuilderProvider = Provider<Dio>((ref) => DioBuilder.getInstance(
    interceptors: [ref.watch(commonInterceptor), ref.watch(authInterceptor)]));

final authApiProvider =
    Provider((ref) => AuthApi(ref.watch(authDioBuilderProvider)));
