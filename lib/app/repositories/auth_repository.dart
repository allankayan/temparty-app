import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/local/user_local_storage.dart';
import 'package:temparty/app/repositories/user_repository.dart';

@injectable
class AuthRepository {
  final UserLocalStorage _userLocal;
  final UserRepository _userRepository;

  AuthRepository(this._userLocal, this._userRepository);

  Future<void> login(String email, String password) async {
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user != null) {
          final userData = await _userRepository.saveUser();
          _userLocal.saveUserData(jsonEncode(userData));
        }
      });
    } on FirebaseAuthException {
      Fluttertoast.showToast(
        msg: 'Preencha corretamente as suas informações',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.deepPurple,
      );
    }
  }

  Future<void> register(String email, String name, String date, String password) async {
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user != null) {
          DatabaseReference ref = FirebaseDatabase.instance.ref("users").child(user.uid);
          await ref.set({
            "userUid": user.uid,
            "displayName": name,
            "email": email,
            "birthday": date,
          });
          final userData = await _userRepository.saveUser();
          _userLocal.saveUserData(jsonEncode(userData));
        }
      });
    } on Exception {
      Fluttertoast.showToast(
        msg: 'Não foi possível criar sua conta, tente mais tarde.',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.deepPurple,
      );
    }
  }

  Future<void> logout() async {
    try {
      await _userLocal.deleteUserData();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      Fluttertoast.showToast(
        msg: e as String,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.deepPurple,
      );
    }
  }
}
