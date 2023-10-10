import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leschat/dependency_injection.dart';
import 'package:leschat/presentation/pages/splash_page.dart';
import '../../presentation/pages/chat_message_page.dart';
import '../../presentation/pages/forgot_password_page.dart';
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/login_page.dart';
import '../../presentation/pages/register_page.dart';
import '../../presentation/pages/show_n_add_users_page.dart';
import '../../presentation/pages/group_message_page.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => SplashPage(
          authBloc: sl.call(),
        ),
      ),
      // login route
      GoRoute(
        path: '/login',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => LoginPage(authBloc: sl.call()),
      ),
      GoRoute(
          path: '/forgotPassword',
          parentNavigatorKey: rootNavigatorKey,
          builder: ((context, state) =>
              ForgotPasswordPage(authBloc: sl.call()))),
      // register route
      GoRoute(
        path: '/register',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => RegisterPage(
          authBloc: sl.call(),
        ),
      ),

      GoRoute(
        path: '/home',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => HomePage(
          authBloc: sl.call(),
        ),
      ),

      GoRoute(
        path: '/showAndAddUsers',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const ShowAndAddUsersPage(),
      ),
      // GoRoute(
      //   path: '/chat/:chatId',
      //   parentNavigatorKey: rootNavigatorKey,
      //   builder: (context, state) => ChatMessagePage(),
      // ),
      GoRoute(
        path: '/group/:groupId',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const GroupMessagePage(),
      )
    ],
    errorBuilder: (context, state) {
      return const Scaffold(
        body: Center(
            child: Text(
          'Ouch! Page Not Found :X',
          style: TextStyle(fontSize: 30),
        )),
      );
    },
  );

  GoRouter get getRoutes => router;
}
