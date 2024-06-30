import 'package:flutter/foundation.dart';
import 'package:flutter_base/src/presentation/base/process_state.dart';

class BaseViewModel extends ChangeNotifier {
  final List<ProcessState> processes = [];
}
