import '../../../domain/entities/chat.dart';
import '../../../domain/entities/user.dart';

abstract class ChatRemoteDataSource {
  Future<List<Chat>> getAllChats(String userId);
  Future<List<User>> getUsersByQuery(String query);
}
