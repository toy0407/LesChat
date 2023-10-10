import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leschat/presentation/blocs/bloc/auth_bloc.dart';

class SplashPage extends StatefulWidget {
  final AuthBloc authBloc;
  const SplashPage({super.key, required this.authBloc});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    widget.authBloc.add(AuthIsSignedInEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: widget.authBloc,
      listener: (context, state) {
        if (state is LoginSuccess) {
          Future.delayed(Duration(seconds: 2), () {
            context.go('/home');
          });
        } else if (state is LoginFailure) {
          Future.delayed(Duration(seconds: 2), () {
            context.go('/login');
          });
        }
        print(state);
      },
      child: Scaffold(
        body: Center(
          child: Text('Splash Page'),
        ),
      ),
    );
  }
}
