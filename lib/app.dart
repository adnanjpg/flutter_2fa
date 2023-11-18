import 'package:flutter/material.dart';
import 'package:flutter_2fa/app_init_prov.dart';
import 'package:flutter_2fa/home.dart';
import 'package:flutter_2fa/ui/loading_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TheApp extends StatelessWidget {
  const TheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'GeistMono',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
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
      ),
    );
  }
}
