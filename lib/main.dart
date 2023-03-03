import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leschat/presentation/blocs/cubit/auth_cubit.dart';
import 'package:leschat/presentation/blocs/cubit/conversations_cubit.dart';
import 'core/routes/router.dart';
import 'dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GoRouter router = AppRouter.router;
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider<ConversationsCubit>(
            create: (_) => di.sl<ConversationsCubit>()..appStarted())
      ],
      child: MaterialApp.router(
        title: 'LesChat',
        theme: FlexThemeData.light(
            useMaterial3: false,
            scheme: FlexScheme.green,
            appBarStyle: FlexAppBarStyle.scaffoldBackground),
        darkTheme: FlexThemeData.dark(
            useMaterial3: true,
            scheme: FlexScheme.green,
            appBarStyle: FlexAppBarStyle.scaffoldBackground),
        themeMode: ThemeMode.light,
        routerConfig: router,
      ),
    );
  }
}
