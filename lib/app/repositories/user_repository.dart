import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/local/user_local_storage.dart';
import 'package:temparty/app/data/model/user_model.dart';

@injectable
class UserRepository {
  final UserLocalStorage _userLocal;
  late StreamSubscription<DatabaseEvent?> _userStream;
  final DatabaseReference ref = FirebaseDatabase.instance.ref().child("users");
  late User? currentUser;

  UserRepository(this._userLocal) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        currentUser = FirebaseAuth.instance.currentUser;
        // _userStream = ref.child(currentUser!.uid).onValue.listen((DatabaseEvent event) {
        //   final data = event.snapshot.value as Map<dynamic, dynamic>;
        //   _onListenUser(UserModel.fromJson(data));
        // });
      } else {
        null;
      }
    });
  }

  // void _onListenUser(UserModel? user) async {
  //   await updateCurrentUserInfo();
  // }
  Future<UserModel?> getUser() async {
    final user = await _userLocal.getUserData();
    if (user != null) return UserModel.fromJson(jsonDecode(user));
    return null;
  }

  Future<UserModel?> saveUser() async {
    final snapshot = await ref.child(currentUser!.uid).get();
    final data = snapshot.value as Map<dynamic, dynamic>;

    if (snapshot.value != null) return UserModel.fromJson(data);
    return null;
  }
}
