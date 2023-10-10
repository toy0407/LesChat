import 'package:dartz/dartz.dart';
import 'package:leschat/domain/entities/user.dart';

import '../../../core/error/failures.dart';
import '../../repositories/chat_repository.dart';

class GetUserDetailsUsecase {
  final ChatRepository chatRepository;

  GetUserDetailsUsecase({
    required this.chatRepository,
  });

  Future<Either<Failure, User>> getUserDetails(String userId) {
    return chatRepository.getUserDetails(userId);
  }
}
