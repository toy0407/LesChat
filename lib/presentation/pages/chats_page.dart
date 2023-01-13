import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> with TickerProviderStateMixin {
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
        title: const Text('Conversations',
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
                itemCount: 1000,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text('Chat ${index + 1}'),
                  );
                })),
          )
        ]),
      ),
    );
  }
}
