import '../../domain/entities/chat.dart';

class ChatModel extends Chat {
  ChatModel({super.chatId, super.userId_1, super.userId_2, super.messagesList});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      chatId: json['_id'] == null ? null : json['_id'] as String,
      userId_1: json['userId_1'] == null ? null : json['userId_1'] as String,
      userId_2: json['userId_2'] == null ? null : json['userId_2'] as String,
      messagesList:
          (json['messagesList'] != null || json['messagesList'].length == 0)
              ? []
              : json['messagesList'] as List<String>,
    );
  }

  Map<String, dynamic> toJson(ChatModel chat) => <String, dynamic>{
        'chatId': chat.chatId,
        'userId_1': chat.userId_1,
        'userId_2': chat.userId_2,
        'messagesList': chat.messagesList
      };
}
