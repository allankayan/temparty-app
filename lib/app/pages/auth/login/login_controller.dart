import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:temparty/app/data/use_cases/auth/login.dart';
import 'package:temparty/dir/dir.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final login = getIt.get<Login>();

  @observable
  TextEditingController email = TextEditingController();

  @observable
  TextEditingController password = TextEditingController();

  @action
  Future<void> signIn() async {
    if (email.text != "") {
      try {
        await login.login(email.text, password.text);
        Modular.to.pushReplacementNamed('/main');
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(
          msg: e.message!,
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.deepPurple,
        );
      }
    } else {}
  }
}
