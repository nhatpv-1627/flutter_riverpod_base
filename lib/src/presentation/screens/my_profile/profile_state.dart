import 'package:flutter_base/src/presentation/base/process.dart';

class ProfileState {
  ProcessStatus status = ProcessStatus.initial;
  Object? error;

  ProfileState({
    required this.status,
    this.error,
  });

  ProfileState copyWith({
    ProcessStatus? status,
    Object? error,
  }) {
    return ProfileState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
