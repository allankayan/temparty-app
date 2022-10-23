import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'edit_controller.g.dart';

class EditController = _EditControllerBase with _$EditController;

abstract class _EditControllerBase with Store {
  @observable
  User user = FirebaseAuth.instance.currentUser!;

  @action
  Future<void> updateAccount(String newName, String newEmail) async {
    if (newName != user.displayName) {
      await user.updateDisplayName(newName);
    } else if (newEmail != user.email) {
      await user.updateEmail(newEmail);
    } else {
      Modular.to.pop();
    }
  }
}
