import 'package:flutter_base/src/data/local/storage/storage_keys.dart';
import 'package:flutter_base/src/di/local_provider.dart';
import 'package:flutter_base/src/presentation/navigation/screen_paths.dart';
import 'package:flutter_base/src/shared/extensions/string_exts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state.g.dart';

@riverpod
class CurrentAuthState extends _$CurrentAuthState {
  @override
  AuthState build() {
    final secureStorage = ref.watch(secureStorageProvider).requireValue;
    final token = secureStorage.get(StorageKeys.accessToken.name);
    return token.isNullOrEmpty
        ? AuthState.unauthenticated
        : AuthState.authenticated;
  }

  void invalidate() {
    ref.invalidateSelf();
  }
}

/// The possible authentication states of the app.
enum AuthState {
  unknown(
    redirectPath: '/',
    allowedPaths: [
      '/',
    ],
  ),
  unauthenticated(
    redirectPath: ScreenPaths.login,
    allowedPaths: [
      ScreenPaths.login,
      ScreenPaths.settings,
    ],
  ),
  authenticated(
    redirectPath: ScreenPaths.home,
    allowedPaths: [
      ScreenPaths.home,
      '${ScreenPaths.home}/${ScreenPaths.movieDetail}',
      ScreenPaths.searchMovies,
      '${ScreenPaths.searchMovies}/${ScreenPaths.movieDetail}',
      ScreenPaths.myProfile,
      ScreenPaths.movieDetail,
      ScreenPaths.settings,
    ],
  ),
  ;

  const AuthState({
    required this.redirectPath,
    required this.allowedPaths,
  });

  /// The target path to redirect when the current route is not allowed in this
  /// auth state.
  final String redirectPath;

  /// List of paths allowed when the app is in this auth state.
  final List<String> allowedPaths;
}
