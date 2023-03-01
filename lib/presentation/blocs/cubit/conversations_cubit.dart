import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:leschat/domain/entities/chat.dart';
import '../../../domain/usecases/chats/get_all_chats_usecase.dart';

part 'conversations_state.dart';

class ConversationsCubit extends Cubit<ConversationsState> {
  final GetAllChatsUsecase getAllChatsUsecase;

  ConversationsCubit({required this.getAllChatsUsecase})
      : super(ConversationsInitial());

  Future<void> appStarted() async {
    emit(ConversationsInitial());
  }

  Future<List<Chat>> getAllChats(String userId) async {
    List<Chat> chatsList = [];

    try {
      emit(ConversationsLoading());
      var result = await getAllChatsUsecase.getAllChats(userId);
      result.fold((failure) => emit(ConversationsFailure()), (success) {
        emit(ConversationsSuccess());
        chatsList = success;
      });
    } catch (err) {
      emit(ConversationsFailure());
    }
    return chatsList;
  }
}
