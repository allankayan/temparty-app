import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  @observable
  User user = FirebaseAuth.instance.currentUser!;

  @action
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Modular.to.pushReplacementNamed('/login');
  }
}
