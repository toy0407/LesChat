import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage>
    with AutomaticKeepAliveClientMixin {
  late TextEditingController _searchTextEditingController;

  @override
  void initState() {
    super.initState();
    _searchTextEditingController = TextEditingController();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
    _searchTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
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
