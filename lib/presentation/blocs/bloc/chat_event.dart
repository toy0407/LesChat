part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class GetUserDetailsEvent extends ChatEvent {
  final String userId;
  const GetUserDetailsEvent(this.userId);
}

class GetAllMessagesEvent extends ChatEvent {
  final String chatId;
  const GetAllMessagesEvent(this.chatId);
}

class SendMessageEvent extends ChatEvent {
  final String text, chatId, userId, mediaUrl;
  const SendMessageEvent(this.text, this.chatId, this.userId, this.mediaUrl);
}
