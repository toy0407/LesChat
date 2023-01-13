import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowAndAddUsersPage extends StatefulWidget {
  const ShowAndAddUsersPage({super.key});

  @override
  State<ShowAndAddUsersPage> createState() => _ShowAndAddUsersPageState();
}

class _ShowAndAddUsersPageState extends State<ShowAndAddUsersPage> {
  late TextEditingController searchUsersTextEditingController;

  @override
  void initState() {
    super.initState();
    searchUsersTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchUsersTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Members', style: TextStyle(fontSize: 24)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CupertinoSearchTextField(
                controller: searchUsersTextEditingController,
              )
            ],
          ),
        ));
  }
}
