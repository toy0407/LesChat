// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:leschat/core/error/failures.dart';
import 'package:leschat/domain/entities/chat.dart';
import 'package:leschat/domain/repositories/chat_repository.dart';

class GetAllChatsUsecase {
  final ChatRepository chatRepository;

  GetAllChatsUsecase({
    required this.chatRepository,
  });

  Future<Either<Failure, List<Chat>>> getAllChats(String userId) {
    return chatRepository.getAllChats(userId);
  }
}
