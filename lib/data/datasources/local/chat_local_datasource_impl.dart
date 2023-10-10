// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:leschat/data/datasources/local/chat_local_datasource.dart';
import 'package:leschat/data/datasources/remote/chat_remote_datasource.dart';
import 'package:leschat/domain/entities/chat.dart';

class ChatLocalDataSourceImpl implements ChatLocalDataSource {
  ChatRemoteDataSource chatRemoteDataSource;

  ChatLocalDataSourceImpl({
    required this.chatRemoteDataSource,
  });
  @override
  Future<List<Chat>> getAllChats(String userId) async {
    var chats = await chatRemoteDataSource.getAllChats(userId);

    return chats;
  }
}
