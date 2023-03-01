// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:leschat/core/error/failures.dart';
import 'package:leschat/data/datasources/local/chat_local_datasource.dart';
import 'package:leschat/data/datasources/remote/chat_remote_datasource.dart';
import 'package:leschat/domain/entities/chat.dart';

import '../../domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  // ChatRemoteDataSource chatRemoteDataSource;
  ChatLocalDataSource chatLocalDataSource;

  ChatRepositoryImpl({required this.chatLocalDataSource});

  @override
  Future<Either<Failure, List<Chat>>> getAllChats(String userId) async {
    try {
      List<Chat> chatList = await chatLocalDataSource.getAllChats(userId);
      return Right(chatList);
    } catch (err) {
      return Left(Failure());
    }
  }
}