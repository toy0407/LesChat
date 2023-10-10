import 'package:dartz/dartz.dart';
import 'package:leschat/domain/entities/message.dart';

import '../../../core/error/failures.dart';
import '../../repositories/chat_repository.dart';

class GetMessagesByChatIdUsecase {
  final ChatRepository chatRepository;

  GetMessagesByChatIdUsecase({
    required this.chatRepository,
  });

  Future<Either<Failure, List<Message>>> getMessagesByChatId(String chatId) {
    return chatRepository.getMessagesByChatId(chatId);
  }
}
