import 'package:dartz/dartz.dart';
import 'package:leschat/domain/entities/message.dart';
import '../entities/user.dart';
import '../../core/error/failures.dart';
import '../entities/chat.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<Chat>>> getAllChats(String userId);
  Future<Either<Failure, List<User>>> getUsersByQuery(String query);
  // get Details of user by user id (getUserDetails)
  Future<Either<Failure, User>> getUserDetails(String userId);
  // get all messages by chat id (getMessagesByChatId)
  Future<Either<Failure, List<Message>>> getMessagesByChatId(String chatId);
  // send message
  Future<Either<Failure, bool>> sendMessage(
      {required String text,
      required String chatId,
      required String userId,
      required String mediaUrl});
}
