import 'package:flutter_base/src/data/app_error.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProcessState<T> {
  AsyncValue<T>? value;

  void onSuccess(T data) {
    value = AsyncValue.data(data);
  }

  void onError(AppError error) {
    value = AsyncError(error, StackTrace.current);
  }

  void onLoading() {
    value = const AsyncLoading();
  }
}
