// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_base/src/di/usecase_provider.dart';
import 'package:flutter_base/src/domain/usecase/login_usecase.dart';
import 'package:flutter_base/src/presentation/base/process.dart';
import 'package:flutter_base/src/presentation/screens/login/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() {
    return LoginState(status: ProcessStatus.initial);
  }

  Future<void> login(String username, String password) async {
    try {
      state = state.copyWith(status: ProcessStatus.loading);
      final input = LoginInput(username: username, password: password);
      await ref.watch(loginUseCaseProvider).call(input);
      state = state.copyWith(status: ProcessStatus.success);
    } catch (e) {
      state = state.copyWith(status: ProcessStatus.failure, error: e);
    }
  }
}
