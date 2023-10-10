class User {
  late String? userId;
  late String? userToken;
  late String? username;
  late String? name;
  late String? password;
  late String? phoneNumber;
  late String? about;
  late String? email;
  //TODO: Add gender
  late String? image;
  late String? lastSeen;
  late List<String>? chatsListIds;
  late List<String>? groupsListIds;

  User({
    this.userId,
    this.userToken,
    this.username,
    this.name,
    this.password,
    this.email,
    this.phoneNumber,
    this.about,
    this.image,
    this.lastSeen,
    this.chatsListIds,
    this.groupsListIds,
  });
}
