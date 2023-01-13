import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  late TextEditingController _searchTextEditingController;

  @override
  void initState() {
    super.initState();
    _searchTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groups',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500)),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.ellipsis_vertical,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const SizedBox(
            height: 5,
          ),
          CupertinoSearchTextField(
            onChanged: (value) {},
            onSubmitted: (value) {},
            controller: _searchTextEditingController,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text('Group ${index + 1}'),
                  );
                })),
          )
        ]),
      ),
    );
  }
}
