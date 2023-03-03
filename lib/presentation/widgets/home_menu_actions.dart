import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/cubit/auth_cubit.dart';

class HomeMenuActions extends StatefulWidget {
  const HomeMenuActions({super.key});

  @override
  State<HomeMenuActions> createState() => _HomeMenuActionsState();
}

class _HomeMenuActionsState extends State<HomeMenuActions> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(CupertinoIcons.ellipsis_vertical),
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
            BlocProvider.of<AuthCubit>(context).signOut();
            context.go('/login');
            break;
        }
      },
    );
  }
}
