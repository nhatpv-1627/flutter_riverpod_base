import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'prefs.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> prefs(PrefsRef ref) =>
    SharedPreferences.getInstance();
