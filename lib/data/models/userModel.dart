// ignore_for_file: public_member_api_docs, sort_constructors_first
import './chatListModel.dart';
import '../../resources/strings_manager.dart';

class User {
  int userId;
  String fullName;
  String? about = AppStrings.defaultAbout;
  String username;
  String? phoneNumber;
  String? email;
  DateTime lastSeen;
  List<ChatList>? chatsList;

  User({
    required this.userId,
    required this.fullName,
    this.about,
    required this.username,
    this.phoneNumber,
    this.email,
    required this.lastSeen,
    this.chatsList,
  });
}
