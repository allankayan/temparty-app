import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:temparty/app/data/model/user_model.dart';
import 'package:temparty/app/data/use_cases/user/get_user_data.dart';
import 'package:temparty/app/data/use_cases/user/update_user_data.dart';
import 'package:temparty/dir/dir.dart';

part 'edit_controller.g.dart';

class EditController = _EditControllerBase with _$EditController;

abstract class _EditControllerBase with Store {
  final getUserData = getIt.get<GetUserData>();
  final updateUserData = getIt.get<UpdateUserData>();

  @observable
  late ObservableFuture<UserModel> user = getUserData.getUserData().asObservable();

  @observable
  TextEditingController name = TextEditingController();

  @observable
  TextEditingController bio = TextEditingController();

  @observable
  TextEditingController date = MaskedTextController(mask: '00/00/0000');

  @action
  Future<void> updateAccount() async {
    try {
      final userData = {
        "displayName": name.text,
        "bio": bio.text,
        "birthday": date.text,
      };
      await updateUserData.updateUserData(userData);
    } on Exception catch (e) {
      Fluttertoast.showToast(
        msg: '$e',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.deepPurple,
      );
    }
  }
}
