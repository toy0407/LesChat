import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'core/routes/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GoRouter router = AppRouter.router;
    return MaterialApp.router(
      title: 'LesChat',
      theme: FlexThemeData.light(
          scheme: FlexScheme.green,
          appBarStyle: FlexAppBarStyle.scaffoldBackground),
      darkTheme: FlexThemeData.dark(
          scheme: FlexScheme.green,
          appBarStyle: FlexAppBarStyle.scaffoldBackground),
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
