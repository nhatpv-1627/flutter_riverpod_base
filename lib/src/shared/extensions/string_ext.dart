import 'package:flutter_base/src/shared/const.dart';

extension StringExt on String? {
  String orEmpty() => this ?? empty;
}
