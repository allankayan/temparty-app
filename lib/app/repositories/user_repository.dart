import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/data_sources/user/user_local_data_source.dart';
import 'package:temparty/app/data/data_sources/user/user_remote_data_source.dart';
import 'package:temparty/app/data/model/user_model.dart';

@injectable
class UserRepository {
  final UserLocalDataSource _userLocal;
  final UserRemoteDataSource _userRemote;

  UserRepository(this._userLocal, this._userRemote);

  Future<UserModel?> getUserData() async {
    final user = await _userLocal.getUserData();
    if (user != null) return UserModel.fromJson(jsonDecode(user));
    return _userRemote.getUserData();
  }

  Future<void> loginUser() async {
    await _userLocal.deleteUserData();
    final userData = await _userRemote.getUserData();
    await _userLocal.saveUserData(jsonEncode(userData));
  }

  Future<void> createUserData(Map<String, String> data) async {
    await _userLocal.deleteUserData();
    final userData = jsonEncode(data);
    final user = UserModel.fromJson(jsonDecode(userData));

    await _userRemote.createUserData(user);
  }

  Future<void> updateUserData(Map<String, String> data) async {
    await _userRemote.updateUserData(data);
    await _userLocal.deleteUserData();
    await getUserData();
  }
}
