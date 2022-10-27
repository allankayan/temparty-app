import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
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

  @observable
  bool isLoading = false;

  @observable
  RoundedLoadingButtonController btnController = RoundedLoadingButtonController();

  @action
  Future<void> signIn() async {
    if (email.text != "") {
      try {
        btnController.start();
        await login.login(email.text, password.text);
      } on FirebaseAuthException catch (e) {
        btnController.stop();
        Fluttertoast.showToast(
          msg: e.message!,
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.deepPurple,
        );
      }
    } else {
      btnController.stop();
      Fluttertoast.showToast(
        msg: "Preencha suas informações corretamente.",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.deepPurple,
      );
    }
  }
}
