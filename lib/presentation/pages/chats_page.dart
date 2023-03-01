import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/cubit/auth_cubit.dart';
import '../blocs/cubit/conversations_cubit.dart';
import '../widgets/chat_list_widget_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/chat.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> with TickerProviderStateMixin {
  late TextEditingController _searchTextEditingController;
  List<Chat> chatsList = [];

  @override
  void initState() {
    super.initState();
    _searchTextEditingController = TextEditingController();
    checkUser();
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
          PopupMenuButton(
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
          ),
        ],
      ),
      body: BlocListener<ConversationsCubit, ConversationsState>(
        listener: (context, conversationsState) {
          if (conversationsState is ConversationsLoading) print('Loading');
          if (conversationsState is ConversationsSuccess) print('Success');
          if (conversationsState is ConversationsFailure) print('Failure');
        },
        child: _body(),
      ),
    );
  }

  void checkUser() async {
    var prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('selfUserId');
    print(userId);
    getAllChats(userId!);
  }

  void getAllChats(String userId) async {
    chatsList =
        await BlocProvider.of<ConversationsCubit>(context).getAllChats(userId);
  }

  Widget _body() {
    return Padding(
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
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: BlocBuilder<ConversationsCubit, ConversationsState>(
            builder: (context, state) {
              if (state is ConversationsSuccess) {
                return ListView.builder(
                    itemCount: chatsList.length,
                    itemBuilder: ((context, index) {
                      return ChatListWidgetItem(
                        username: chatsList.elementAt(index).userId_1!,
                        lastMessage: chatsList.elementAt(index).userId_2!,
                      );
                    }));
              }
              if (state is ConversationsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return const Center(
                child: Text('Failed to load data'),
              );
            },
          ),
        )
      ]),
    );
  }
}
