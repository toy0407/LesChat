import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leschat/presentation/blocs/bloc/auth_bloc.dart';

class HomeMenuActions extends StatefulWidget {
  final AuthBloc authBloc;
  const HomeMenuActions({super.key, required this.authBloc});

  @override
  State<HomeMenuActions> createState() => _HomeMenuActionsState();
}

class _HomeMenuActionsState extends State<HomeMenuActions> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(CupertinoIcons.ellipsis_vertical),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18.0))),
      itemBuilder: ((context) {
        return [
          const PopupMenuItem(
            value: 0,
            child: Text('Account'),
          ),
          const PopupMenuItem(
            value: 1,
            child: Text('Settings'),
          ),
          const PopupMenuItem(
            value: 2,
            child: Text('Logout'),
          ),
        ];
      }),
      onSelected: (value) {
        switch (value) {
          case 0:
            break;
          case 1:
            break;
          case 2:
            widget.authBloc.add(AuthSignOutEvent());
            context.go('/login');
            break;
        }
      },
    );
  }
}
