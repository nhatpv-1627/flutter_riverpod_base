import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/generated/colors.gen.dart';
import 'package:flutter_base/src/presentation/navigation/router.dart';
import 'package:flutter_base/src/shared/global_state/theme_mode.dart';
import 'package:flutter_base/theme/methods.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FlutterBaseApp extends StatefulHookConsumerWidget {
  const FlutterBaseApp({super.key});

  @override
  ConsumerState<FlutterBaseApp> createState() => _State();
}

class _State extends ConsumerState<FlutterBaseApp> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(currentThemeModeProvider);

    final (lightTheme, darkTheme) = useMemoized(
      () => createDualThemeData(
        seedColor: ColorName.primaryColor,
        useMaterial3: true,
        transformer: (data) => data.copyWith(
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );

    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      routerConfig: router,
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 360, name: MOBILE),
          ],
        );
      },
    );
  }
}
