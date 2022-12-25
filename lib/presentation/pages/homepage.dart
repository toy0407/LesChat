import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(children: const [
          Text(
            'Conversations',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Chats'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search')
      ]),
    );
  }
}
