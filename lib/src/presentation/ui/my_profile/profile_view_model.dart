// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_base/src/di/usecase_provider.dart';
import 'package:flutter_base/src/domain/usecase/base/base_input.dart';
import 'package:flutter_base/src/presentation/base/process.dart';
import 'package:flutter_base/src/presentation/ui/my_profile/profile_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_view_model.g.dart';

@riverpod
class ProfileViewModel extends _$ProfileViewModel {
  @override
  ProfileState build() {
    return ProfileState(status: ProcessStatus.initial);
  }

  Future<void> logout() async {
    try {
      state = state.copyWith(status: ProcessStatus.loading);
      await ref.watch(logoutUseCaseProvider).call(EmptyInput());
      state = state.copyWith(status: ProcessStatus.success);
    } catch (e) {
      state = state.copyWith(status: ProcessStatus.failure, error: e);
    }
  }
}
