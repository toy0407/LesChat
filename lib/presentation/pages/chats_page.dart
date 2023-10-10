import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leschat/presentation/blocs/bloc/auth_bloc.dart';
import 'package:leschat/presentation/pages/chat_message_page.dart';
import '../../dependency_injection.dart';
import '../blocs/cubit/conversations_cubit.dart';
import '../widgets/chat_list_widget_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/chat.dart';

class ChatsPage extends StatefulWidget {
  final AuthBloc authBloc;
  const ChatsPage({super.key, required this.authBloc});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TextEditingController _searchTextEditingController;
  List<Chat> chatsList = [];

  @override
  void initState() {
    super.initState();
    _searchTextEditingController = TextEditingController();
    checkUser();
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
      body: BlocListener<ConversationsCubit, ConversationsState>(
        listener: (context, conversationsState) {
          if (conversationsState is ConversationsLoading) print('Loading');
          if (conversationsState is ConversationsSuccess) print('Success');
          if (conversationsState is ConversationsFailure) print('Failure');
        },
        child: _body(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(CupertinoIcons.person_add),
        onPressed: () {
          context.push('/showAndAddUsers');
        },
      ),
    );
  }

  void checkUser() async {
    var prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('selfUserId');
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
                      return GestureDetector(
                        onTap: () {
                          var chatDetails = chatsList.elementAt(index);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatMessagePage(
                                    chatBloc: sl.call(),
                                    chatDetails: chatDetails),
                              ));
                        },
                        child: ChatListWidgetItem(
                          username: chatsList.elementAt(index).userId_1!,
                          lastMessage: chatsList.elementAt(index).userId_2!,
                        ),
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
