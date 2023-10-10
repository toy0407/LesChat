part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

//Types of States
abstract class UserState extends ChatState {
  const UserState();
}

abstract class MessagesState extends ChatState {
  const MessagesState();
}

abstract class SendMessageState extends ChatState {
  const SendMessageState();
}

//Concrete States
class UserDetailsLoading extends UserState {}

class UserDetailsLoadingFailure extends UserState {}

class UserDetailsLoadingSuccess extends UserState {
  final User user;
  const UserDetailsLoadingSuccess(this.user);
}

class ChatInitial extends ChatState {}

class MessagesInitial extends MessagesState {}

class MessagesLoading extends MessagesState {}

class MessagesLoadingFailure extends MessagesState {}

class MessagesLoadingSuccess extends MessagesState {
  final List<Message> messages;
  const MessagesLoadingSuccess(this.messages);
}

class MessageSending extends SendMessageState {}

class SendMessageSuccess extends SendMessageState {}

class SendMessageFailure extends SendMessageState {}
