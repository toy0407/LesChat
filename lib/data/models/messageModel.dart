// ignore_for_file: public_member_api_docs, sort_constructors_first
class Message {
  int messageId;
  int userId;
  int chatId;
  int groupId;
  int contentId;
  ReadReceipt readReceipt;
  DateTime timeStamp;

  Message({
    required this.messageId,
    required this.userId,
    required this.chatId,
    required this.groupId,
    required this.contentId,
    required this.readReceipt,
    required this.timeStamp,
  });
}

enum ReadReceipt {
  sent,
  delivered,
  seen;
}
