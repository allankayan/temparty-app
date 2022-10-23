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
          await register.register(email.text, name.text, date.text, password.text);
        } on Exception catch (e) {
          Fluttertoast.showToast(
            msg: '$e',
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Colors.deepPurple,
          );
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
        msg: 'Preencha corretamente todas as informações',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.deepPurple,
      );
    }
  }
}
