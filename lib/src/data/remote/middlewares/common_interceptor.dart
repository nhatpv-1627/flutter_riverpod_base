import 'dart:io';

import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';

class CommonInterceptor extends InterceptorsWrapper {
  final String userAgentKey = 'User-Agent';
  final String accept = 'Accept';
  final String acceptValue = 'application/json';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Add more header here
    options.headers[userAgentKey] = await userAgentClientHintsHeader();
    options.headers[accept] = acceptValue;
    handler.next(options);
  }

  Future<String> userAgentClientHintsHeader() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      return '${Platform.operatingSystem} - ${packageInfo.buildNumber}';
    } on Exception catch (_) {
      return 'The Platform not support get info';
    }
  }
}
