import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  @observable
  TextEditingController name = TextEditingController();

  @observable
  TextEditingController email = TextEditingController();

  @observable
  TextEditingController password = TextEditingController();

  @observable
  TextEditingController passwordVerification = TextEditingController();

  @action
  Future<void> createAccount() async {
    if (email.text != "") {
      if (password.text == passwordVerification.text) {
        try {
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email.text, password: password.text);
          User user = FirebaseAuth.instance.currentUser!;
          await user.updateDisplayName(name.text);
          Modular.to.pushReplacementNamed('/main');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            Fluttertoast.showToast(
              msg:
                  'Senha muito fraca, utilize letras maiusculas, minusculas, caracteres especiais, números etc.',
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: Colors.deepPurple,
            );
          } else if (e.code == 'email-already-in-use') {
            Fluttertoast.showToast(
              msg: 'Esta email já está cadastrado no aplicativo, efetue o login.',
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: Colors.deepPurple,
            );
          } else {
            Fluttertoast.showToast(
              msg: e.message!,
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: Colors.deepPurple,
            );
          }
        }
      } else {
        Fluttertoast.showToast(
          msg: 'As senhas precisam ser idênticas',
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.deepPurple,
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: 'Preencha corretamente as suas informações',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.deepPurple,
      );
    }
  }
}
