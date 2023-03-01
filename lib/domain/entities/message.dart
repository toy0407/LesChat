class Message {
  late String? messageId;
  late String? userId;
  late String? chatId;
  late String? groupId;
  late String? contentId;
  late String? readStatus;

  Message(
      {this.messageId,
      this.userId,
      this.chatId,
      this.groupId,
      this.contentId,
      this.readStatus});
}
