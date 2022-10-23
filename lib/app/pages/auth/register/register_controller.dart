import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:temparty/app/data/use_cases/auth/register.dart';
import 'package:temparty/dir/dir.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final register = getIt.get<Register>();

  @observable
  TextEditingController name = TextEditingController();

  @observable
  TextEditingController email = TextEditingController();

  @observable
  TextEditingController password = TextEditingController();

  @observable
  TextEditingController passwordVerification = TextEditingController();

  @observable
  TextEditingController date = MaskedTextController(mask: '00/00/0000');

  @action
  Future<void> createAccount() async {
    if (email.text != "" &&
        name.text != "" &&
        date.text != "" &&
        password.text != "" &&
        passwordVerification.text != "") {
      if (password.text == passwordVerification.text) {
        try {
          register.register(email.text, name.text, date.text, password.text);
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
