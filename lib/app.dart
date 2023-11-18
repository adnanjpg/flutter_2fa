import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2fa/app_init_prov.dart';
import 'package:flutter_2fa/home.dart';
import 'package:flutter_2fa/ui/loading_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TheApp extends StatelessWidget {
  const TheApp({super.key});

  @override
  Widget build(BuildContext context) {
    var light = ThemeData.light(
      useMaterial3: true,
    );
    light = light.copyWith(
      textTheme: light.textTheme.apply(
        fontFamily: 'GeistMono',
      ),
    );

    var dark = ThemeData.dark(
      useMaterial3: true,
    );
    dark = dark.copyWith(
      textTheme: dark.textTheme.apply(
        fontFamily: 'GeistMono',
      ),
    );

    return ProviderScope(
      child: AdaptiveTheme(
        light: light,
        dark: dark,
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            darkTheme: darkTheme,
            home: Consumer(
              builder: (context, ref, child) {
                final isInited = ref.watch(isAppInitedProv);

                if (!isInited) {
                  ref.read(appIniterProv).init();
                  return const LoadingScreen();
                }

                return child!;
              },
              child: const Home(),
            ),
          );
        },
      ),
    );
  }
}
