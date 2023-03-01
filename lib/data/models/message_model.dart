import '../../domain/entities/message.dart';

class MessageModel extends Message {
  MessageModel(
      {super.messageId,
      super.userId,
      super.chatId,
      super.groupId,
      super.contentId,
      super.readStatus});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageId: json['messageId'] == null ? null : json['messageId'] as String,
      userId: json['userId'] == null ? null : json['userId'] as String,
      chatId: json['chatId'] == null ? null : json['chatId'] as String,
      groupId: json['groupId'] == null ? null : json['groupId'] as String,
      contentId: json['contentId'] == null ? null : json['contentId'] as String,
      readStatus:
          json['readStatus'] == null ? null : json['readStatus'] as String,
    );
  }

  Map<String, dynamic> toJson(MessageModel message) => <String, dynamic>{
        'messageId': message.messageId,
        'userId': message.userId,
        'chatId': message.chatId,
        'groupId': message.groupId,
        'contentId': message.contentId,
        'readStatus': message.readStatus
      };
}
