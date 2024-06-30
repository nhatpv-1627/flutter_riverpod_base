import 'package:flutter_base/src/data/app_error.dart';

class BaseObserver<Output> {
  Function()? _onSubscribe;
  Function(Output)? _onSuccess;
  Function(AppError)? _onError;
  Function()? _onCancel;

  void onSubscribe(Function() block) {
    _onSubscribe = block;
  }

  void onSuccess(Function(Output) block) {
    _onSuccess = block;
  }

  void onError(Function(AppError)? block) {
    _onError = block;
  }

  void onCancel(Function() block) {
    _onCancel = block;
  }

  void subscribe() => _onSubscribe?.call();
  void getData(Output output) => _onSuccess?.call(output);
  void getError(AppError error) => _onError?.call(error);
  void cancel() => _onCancel?.call();
}
