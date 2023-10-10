// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:leschat/core/error/failures.dart';
import 'package:leschat/data/datasources/local/chat_local_datasource.dart';
import 'package:leschat/data/datasources/remote/chat_remote_datasource.dart';
import 'package:leschat/domain/entities/chat.dart';
import 'package:leschat/domain/entities/message.dart';
import 'package:leschat/domain/entities/user.dart';

import '../../domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  ChatRemoteDataSource chatRemoteDataSource;
  ChatLocalDataSource chatLocalDataSource;

  ChatRepositoryImpl(
      {required this.chatLocalDataSource, required this.chatRemoteDataSource});

  @override
  Future<Either<Failure, List<Chat>>> getAllChats(String userId) async {
    try {
      List<Chat> chatList = await chatLocalDataSource.getAllChats(userId);
      return Right(chatList);
    } catch (err) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> getUsersByQuery(String query) async {
    try {
      List<User> userList = await chatRemoteDataSource.getUsersByQuery(query);

      return Right(userList);
    } catch (err) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<Message>>> getMessagesByChatId(
      String chatId) async {
    try {
      List<Message> messageList =
          await chatRemoteDataSource.getMessagesByChatId(chatId);
      return Right(messageList);
    } catch (err) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, User>> getUserDetails(String userId) async {
    try {
      User user = await chatRemoteDataSource.getUserDetails(userId);
      return Right(user);
    } catch (err) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, bool>> sendMessage(
      {required String text,
      required String chatId,
      required String userId,
      required String mediaUrl}) async {
    try {
      bool result = await chatRemoteDataSource.sendMessage(
          text: text, chatId: chatId, userId: userId, mediaUrl: mediaUrl);
      return Right(result);
    } catch (err) {
      return Left(Failure());
    }
  }
}
