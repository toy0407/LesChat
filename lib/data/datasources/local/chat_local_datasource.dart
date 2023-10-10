import '../../../domain/entities/chat.dart';

abstract class ChatLocalDataSource {
  Future<List<Chat>> getAllChats(String userId);
}
