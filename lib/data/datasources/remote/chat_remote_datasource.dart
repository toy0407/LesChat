import 'package:leschat/data/models/chat_model.dart';
import 'package:leschat/domain/entities/chat.dart';

abstract class ChatRemoteDataSource {
  Future<List<Chat>> getAllChats(String userId);
}
