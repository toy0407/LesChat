import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../entities/user.dart';
import '../../repositories/chat_repository.dart';

class GetUsersByQueryUsecase {
  final ChatRepository chatRepository;

  GetUsersByQueryUsecase({
    required this.chatRepository,
  });

  Future<Either<Failure, List<User>>> getUsersByQuery(String query) {
    return chatRepository.getUsersByQuery(query);
  }
}
