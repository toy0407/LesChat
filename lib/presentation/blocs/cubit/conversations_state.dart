part of 'conversations_cubit.dart';

abstract class ConversationsState extends Equatable {
  const ConversationsState();

  @override
  List<Object> get props => [];
}

class ConversationsInitial extends ConversationsState {}

class ConversationsLoading extends ConversationsState {}

class ConversationsFailure extends ConversationsState {}

class ConversationsSuccess extends ConversationsState {}
