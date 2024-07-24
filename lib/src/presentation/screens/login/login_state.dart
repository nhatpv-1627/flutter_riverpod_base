import 'package:flutter_base/src/presentation/base/process.dart';

class LoginState {
  ProcessStatus status = ProcessStatus.loading;
  Object? error;

  LoginState({
    required this.status,
    this.error,
  });

  LoginState copyWith({
    ProcessStatus? status,
    Object? error,
  }) {
    return LoginState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
