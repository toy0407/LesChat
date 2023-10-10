import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leschat/domain/entities/chat.dart';
import 'package:leschat/domain/entities/message.dart';
import 'package:leschat/presentation/blocs/bloc/chat_bloc.dart';

import '../widgets/chat_bubble.dart';

class ChatMessagePage extends StatefulWidget {
  const ChatMessagePage(
      {super.key, required this.chatBloc, required this.chatDetails});
  final ChatBloc chatBloc;
  final Chat chatDetails;

  @override
  State<ChatMessagePage> createState() => _ChatMessagePageState();
}

class _ChatMessagePageState extends State<ChatMessagePage> {
  late TextEditingController _textEditingController;
  List<Message> messageList = [];

  @override
  void initState() {
    _textEditingController = TextEditingController();
    widget.chatBloc.add(GetUserDetailsEvent(widget.chatDetails.userId_2!));
    widget.chatBloc.add(GetAllMessagesEvent(widget.chatDetails.chatId!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ChatBloc, ChatState>(
          bloc: widget.chatBloc,
          buildWhen: (previous, current) => current is UserState,
          builder: (context, state) {
            print('Builder ${state}');
            if (state is UserDetailsLoadingSuccess) {
              return Text(state.user.name!);
            } else if (state is UserDetailsLoadingFailure) {
              return Text('Failed to load User details');
            } else if (state is UserDetailsLoading) {
              return CircularProgressIndicator();
            } else
              return Text('Failed');
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(children: [
          Expanded(
            child: BlocConsumer<ChatBloc, ChatState>(
              bloc: widget.chatBloc,
              listenWhen: (previous, current) => current is MessagesState,
              buildWhen: (previous, current) => current is MessagesState,
              listener: (context, state) {
                if (state is MessagesLoadingSuccess) {
                  messageList = state.messages;
                }
              },
              builder: (context, state) {
                if (state is MessagesLoadingSuccess) {
                  return ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return ChatBubble(message: 'Hello World!', sender: false);
                    },
                  );
                } else if (state is MessagesLoadingFailure) {
                  return Text('Failed to load messages');
                } else if (state is MessagesLoading) {
                  return CircularProgressIndicator();
                } else
                  return Text('Failed');
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: () {
                    // Code to handle attaching files
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration.collapsed(
                      hintText: "Type a message...",
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Code to handle sending text
                    String message = _textEditingController.text;
                    if (message.isNotEmpty) {
                      // Send the message
                      _textEditingController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
