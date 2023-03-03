import 'dart:convert';

import 'package:leschat/data/models/chat_model.dart';
import 'package:leschat/domain/entities/user.dart';

import 'chat_remote_datasource.dart';
import '../../../domain/entities/chat.dart';
import 'package:http/http.dart' as http;

import '../../../core/app_strings.dart';

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  @override
  Future<List<Chat>> getAllChats(String userId) async {
    var url = '${AppStrings.backendLink}/chats';
    var response = await http.get(Uri.parse(url),
        headers: {"Content-Type": "application/json", "userid": userId});
    if (response.statusCode == 200) {
      List<Chat> chatList = [];

      List<dynamic> chats = json.decode(response.body)['chats'];

      for (var element in chats) {
        chatList.add(ChatModel.fromJson(element));
      }
      return chatList;
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<User>> getUsersByQuery(String query) {
    // TODO: implement getUsersByQuery
    throw UnimplementedError();
  }
}
