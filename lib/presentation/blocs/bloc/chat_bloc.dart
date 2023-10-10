import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:leschat/domain/usecases/chats/get_all_chats_usecase.dart';
import 'package:leschat/domain/usecases/chats/get_messages_by_chatid_usecase.dart';
import 'package:leschat/domain/usecases/chats/get_user_details_usecase.dart';
import 'package:leschat/domain/usecases/chats/get_users_by_query_usecase.dart';
import 'package:leschat/domain/usecases/chats/send_message_usecase.dart';

import '../../../domain/entities/message.dart';
import '../../../domain/entities/user.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetAllChatsUsecase getAllChatsUsecase;
  final GetMessagesByChatIdUsecase getMessagesByChatIdUsecase;
  final GetUserDetailsUsecase getUserDetailsUsecase;
  final GetUsersByQueryUsecase getUsersByQueryUsecase;
  final SendMessageUsecase sendMessageUsecase;

  ChatBloc(
      {required this.getAllChatsUsecase,
      required this.getMessagesByChatIdUsecase,
      required this.getUserDetailsUsecase,
      required this.getUsersByQueryUsecase,
      required this.sendMessageUsecase})
      : super(ChatInitial()) {
    on<GetUserDetailsEvent>(getUserDetails);
    on<GetAllMessagesEvent>(getAllMessages);
    on<SendMessageEvent>(sendMessage);
  }

  FutureOr<void> getUserDetails(
      GetUserDetailsEvent event, Emitter<ChatState> emit) async {
    emit(UserDetailsLoading());
    var result = await getUserDetailsUsecase.getUserDetails(event.userId);
    result.fold((l) => emit(UserDetailsLoadingFailure()),
        (r) => emit(UserDetailsLoadingSuccess(r)));
  }

  FutureOr<void> getAllMessages(
      GetAllMessagesEvent event, Emitter<ChatState> emit) async {
    emit(MessagesLoading());
    var result =
        await getMessagesByChatIdUsecase.getMessagesByChatId(event.chatId);
    result.fold((l) => emit(MessagesLoadingFailure()),
        (r) => emit(MessagesLoadingSuccess(r)));
  }

  FutureOr<void> sendMessage(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    emit(MessageSending());
    var result = await sendMessageUsecase.sendMessage(
        text: event.text,
        chatId: event.chatId,
        userId: event.userId,
        mediaUrl: event.mediaUrl);
    result.fold(
        (l) => emit(SendMessageFailure()), (r) => emit(SendMessageSuccess()));
  }
}
