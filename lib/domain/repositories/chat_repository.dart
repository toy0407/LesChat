import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../../core/error/failures.dart';
import '../entities/chat.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<Chat>>> getAllChats(String userId);
  Future<Either<Failure, List<User>>> getUsersByQuery(String query);
}
