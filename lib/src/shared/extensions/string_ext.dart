import 'package:flutter_base/src/shared/const.dart';

extension StringExt on String? {
  String orEmpty() => this ?? empty;

  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }
}
