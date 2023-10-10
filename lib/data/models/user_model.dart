import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {super.userId,
      super.userToken,
      super.username,
      super.name,
      super.password,
      super.email,
      super.phoneNumber,
      super.about,
      super.image,
      super.lastSeen,
      super.chatsListIds,
      super.groupsListIds});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    print('in user model');
    var user = UserModel(
        userId: json['_id'] == null ? null : json['_id'] as String,
        username: json['username'] == null ? null : json['username'] as String,
        name: json['name'] == null ? null : json['name'] as String,
        // userToken: json['token'] == null ? null : json['token'] as String,
        // password: json['password'] as String,
        // phoneNumber:
        //     json['phoneNumber'] == null ? null : json['phoneNumber'] as String,
        // about: json['about'] == null ? null : json['about'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        // image: json['image'] == null ? null : json['image'] as String,
        // lastSeen: json['lastSeen'] == null ? null : json['lastSeen'] as String,
        chatsListIds: json['chatsList'] == null
            ? null
            : json['chatsList'] as List<String>,
        groupsListIds: json['groupsList'] == null
            ? null
            : json['groupsList'] as List<String>);
    print(user);
    return user;
  }

  Map<String, dynamic> toJson(UserModel user) => <String, dynamic>{
        'name': user.name,
        'username': user.username,
        'password': user.password,
        'phoneNumber': user.phoneNumber,
        'about': user.about,
        'email': user.email,
        'image': user.image,
        'lastSeen': user.lastSeen,
        'chatsList': user.chatsListIds,
        'groupsList': user.groupsListIds,
      };
}
