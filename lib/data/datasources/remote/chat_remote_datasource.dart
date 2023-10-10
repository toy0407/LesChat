import 'package:leschat/data/models/message_model.dart';
import '../../../domain/entities/chat.dart';
import '../../../domain/entities/user.dart';

abstract class ChatRemoteDataSource {
  Future<List<Chat>> getAllChats(String userId);
  Future<List<User>> getUsersByQuery(String query);
  // get Details of user by user id (getUserDetails)
  Future<User> getUserDetails(String userId);
  // get all messages by chat id (getMessagesByChatId)
  Future<List<MessageModel>> getMessagesByChatId(String chatId);
  // send message
  Future<bool> sendMessage(
      {required String text,
      required String chatId,
      required String userId,
      required String mediaUrl});
}
