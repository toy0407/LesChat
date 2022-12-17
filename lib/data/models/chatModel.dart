// ignore_for_file: public_member_api_docs, sort_constructors_first
import './messageModel.dart';

class Chat {
  int chatId;
  int userId;
  late List<Message>? messagesList;
  Chat({
    required this.chatId,
    required this.userId,
    this.messagesList,
  });
}
