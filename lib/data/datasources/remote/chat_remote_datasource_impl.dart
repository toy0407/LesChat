import 'dart:convert';

import 'package:leschat/data/models/chat_model.dart';
import 'package:leschat/data/models/message_model.dart';
import 'package:leschat/data/models/user_model.dart';
import 'package:leschat/domain/entities/user.dart';

import 'chat_remote_datasource.dart';
import 'package:http/http.dart' as http;

import '../../../core/app_strings.dart';

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  @override
  Future<List<ChatModel>> getAllChats(String userId) async {
    var url = '${AppStrings.backendLink}/chats';
    var response;
    try {
      response = await http.get(Uri.parse(url),
          headers: {"Content-Type": "application/json", "userid": userId});
    } catch (e) {
      print(e);
    }
    if (response.statusCode == 200) {
      List<ChatModel> chatList = [];

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
  Future<List<UserModel>> getUsersByQuery(String query) {
    // TODO: implement getUsersByQuery
    throw UnimplementedError();
  }

  @override
  Future<List<MessageModel>> getMessagesByChatId(String chatId) {
    // TODO: implement getMessagesByChatId
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getUserDetails(String userId) async {
    var url = 'http://localhost:3000/users/${userId}';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('object');
      var user = UserModel.fromJson(json.decode(response.body));
      print('user');
      return user;
    } else {
      throw Exception();
    }
  }

  @override
  Future<bool> sendMessage(
      {required String text,
      required String chatId,
      required String userId,
      required String mediaUrl}) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
}
