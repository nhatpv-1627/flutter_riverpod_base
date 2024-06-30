import 'package:flutter_base/src/data/app_error.dart';

mixin DataSource {
  Future<T> excuse<T>(Future<T> Function() block) async {
    try {
      return await block();
    } catch (e) {
      throw AppError.from(e);
    }
  }
}
