import 'package:flutter/material.dart';
import 'package:leschat/presentation/blocs/bloc/auth_bloc.dart';
import 'package:leschat/presentation/pages/chats_page.dart';
import 'package:leschat/presentation/pages/groups_page.dart';
import 'package:leschat/presentation/widgets/home_menu_actions.dart';

class HomePage extends StatefulWidget {
  final AuthBloc authBloc;
  const HomePage({super.key, required this.authBloc});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('LesChat',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500)),
          centerTitle: false,
          actions: [HomeMenuActions(authBloc: widget.authBloc)],
          bottom: TabBar(controller: _tabController, tabs: const [
            Tab(
              text: 'Chats',
              // icon: Icon(Icons.message),
            ),
            Tab(
              text: 'Groups',
              // icon: Icon(Icons.group),
            )
          ]),
        ),
        body: TabBarView(controller: _tabController, children: [
          ChatsPage(authBloc: widget.authBloc),
          GroupsPage(authBloc: widget.authBloc)
        ]),
      ),
    );
  }
}
