import 'package:shared_preferences/shared_preferences.dart';

import '/domain/entities/user.dart';
import '../../../core/app_strings.dart';
import '../../models/user_model.dart';
import '/data/datasources/remote/auth_remote_datasource.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> signIn(User user) async {
    var url = '${AppStrings.backendLink}/users/login';
    Map data = {'email': user.email, 'password': user.password};
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: json.encode(data));
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      var currentuser = UserModel.fromJson(json.decode(response.body));
      await prefs.setString('selfUserId', currentuser.userId!);
      return currentuser;
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignedIn() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('selfUserId') == null) return false;
    return true;
  }

  @override
  Future<void> signOut() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('selfUserId');
  }

  @override
  Future<UserModel> signUp(User user) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
