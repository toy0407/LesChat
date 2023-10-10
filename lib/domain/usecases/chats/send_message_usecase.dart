import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../repositories/chat_repository.dart';

class SendMessageUsecase {
  final ChatRepository chatRepository;

  SendMessageUsecase({
    required this.chatRepository,
  });

  Future<Either<Failure, bool>> sendMessage(
      {required String text,
      required String chatId,
      required String userId,
      required String mediaUrl}) {
    return chatRepository.sendMessage(
        text: text, chatId: chatId, userId: userId, mediaUrl: mediaUrl);
  }
}
