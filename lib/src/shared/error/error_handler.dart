import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/generated/locale_keys.g.dart';
import 'package:flutter_base/src/data/app_error.dart';
import 'package:flutter_base/src/shared/functions/common_funs.dart';
import 'package:flutter_base/src/shared/global_state/auth_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void handleError(BuildContext context, WidgetRef ref, Object? error,
    {ValueSetter<Object?>? manualHandler}) {
  if (!context.mounted || error == null) return;

  if (error is AppError) {
    // Handle common exceptions
    switch (error.type) {
      case AppErrorType.network:
        showSnackBar(context, LocaleKeys.no_internet.tr());
        return;
      case AppErrorType.unauthorized:
        // Refresh auth state and screen navigation will be triggered
        ref.read(currentAuthStateProvider.notifier).invalidate();
        return;
      default:
        break;
    }

    if (manualHandler != null) {
      manualHandler(error);
      return;
    }
    showSnackBar(context, error.message ?? '');
  } else {
    if (manualHandler != null) {
      manualHandler.call(error);
      return;
    }
    showSnackBar(context, error.toString());
  }
}
