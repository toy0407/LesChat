import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:leschat/domain/usecases/chats/get_users_by_query_usecase.dart';
import '../../../domain/entities/chat.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/chats/get_all_chats_usecase.dart';

part 'conversations_state.dart';

class ConversationsCubit extends Cubit<ConversationsState> {
  final GetAllChatsUsecase getAllChatsUsecase;
  final GetUsersByQueryUsecase getUsersByQueryUsecase;

  ConversationsCubit(
      {required this.getAllChatsUsecase, required this.getUsersByQueryUsecase})
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

  Future<List<User>> getUsersByQuery(String query) async {
    List<User> userList = [];

    try {
      var result = await getUsersByQueryUsecase.getUsersByQuery(query);
      result.fold((failure) => {}, (success) {
        userList = success;
      });
    } catch (err) {}

    return userList;
  }
}
