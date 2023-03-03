import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leschat/presentation/blocs/cubit/conversations_cubit.dart';

class ShowAndAddUsersPage extends StatefulWidget {
  const ShowAndAddUsersPage({super.key});

  @override
  State<ShowAndAddUsersPage> createState() => _ShowAndAddUsersPageState();
}

class _ShowAndAddUsersPageState extends State<ShowAndAddUsersPage> {
  late TextEditingController _searchUsersTextEditingController;

  @override
  void initState() {
    super.initState();
    _searchUsersTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchUsersTextEditingController.dispose();
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
                controller: _searchUsersTextEditingController,
                onChanged: (value) => _getUsersByQuery(value),
              )
            ],
          ),
        ));
  }

  _getUsersByQuery(String query) {
    BlocProvider.of<ConversationsCubit>(context).getUsersByQuery(query);
  }
}
