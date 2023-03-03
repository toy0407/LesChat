import 'package:flutter/material.dart';
import 'package:leschat/presentation/pages/chats_page.dart';
import 'package:leschat/presentation/pages/groups_page.dart';
import 'package:leschat/presentation/widgets/home_menu_actions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int pageIndex = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          actions: const [HomeMenuActions()],
        ),
        body: TabBarView(
            controller: _tabController,
            children: const [ChatsPage(), GroupsPage()]),
        bottomNavigationBar: NavigationBar(
          selectedIndex: pageIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.message), label: 'Chats'),
            NavigationDestination(icon: Icon(Icons.group), label: 'Groups')
          ],
          onDestinationSelected: (value) {
            if (pageIndex == value) return;
            switch (value) {
              case 0:
                setState(() => pageIndex = value);
                _tabController.animateTo(pageIndex);
                break;
              case 1:
                setState(() => pageIndex = value);
                _tabController.animateTo(pageIndex);
                break;
            }
          },
        ),
      ),
    );
  }
}
