import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  Widget? child;
  HomePage({super.key, required this.child});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      floatingActionButton: FloatingActionButton(
        child: const Icon(CupertinoIcons.person_add),
        onPressed: () {
          context.push('/showAndAddUsers');
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Groups')
        ],
        onTap: (value) {
          if (pageIndex == value) return;
          switch (value) {
            case 0:
              context.go('/chats');
              setState(() {
                pageIndex = value;
              });
              break;
            case 1:
              context.go('/groups');
              setState(() {
                pageIndex = value;
              });
              break;
          }
        },
      ),
    );
  }
}
