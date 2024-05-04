import 'package:flutter/material.dart';
import 'package:multi_player/core/router/app_router.dart';
import 'package:multi_player/core/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: const AppTheme().getTheme(),
    );
  }
}
