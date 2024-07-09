import 'package:flutter/material.dart';
import 'package:flutter_base/src/data/app_error.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AsyncValueUI on AsyncValue<void> {
  bool get isLoading => this is AsyncLoading<void>;

  void showSnackBarOnError(BuildContext context) => whenOrNull(
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text((error as AppError).message ?? ''),
            ),
          );
        },
      );
}
