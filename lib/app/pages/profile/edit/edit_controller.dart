import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:temparty/app/data/model/user_model.dart';
import 'package:temparty/app/data/use_cases/user/get_user_data.dart';
import 'package:temparty/app/data/use_cases/user/remove_profile_image.dart';
import 'package:temparty/app/data/use_cases/user/update_user_data.dart';
import 'package:temparty/dir/dir.dart';

part 'edit_controller.g.dart';

class EditController = _EditControllerBase with _$EditController;

abstract class _EditControllerBase with Store {
  final getUserData = getIt.get<GetUserData>();
  final updateUserData = getIt.get<UpdateUserData>();
  final removeProfileImage = getIt.get<RemoveProfileImage>();

  final ImagePicker picker = ImagePicker();

  @observable
  late ObservableFuture<UserModel> user = getUserData.getUserData().asObservable();

  @observable
  TextEditingController name = TextEditingController();

  @observable
  TextEditingController bio = TextEditingController();

  @observable
  TextEditingController date = MaskedTextController(mask: '00/00/0000');

  @observable
  XFile? image;

  @action
  Future imageFromGallery() async {
    final file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) image = file;
    await updateAccount();
    await refreshPage();
  }

  @action
  Future imageFromCamera() async {
    final file = await picker.pickImage(source: ImageSource.camera);

    if (file != null) image = file;

    await updateAccount();
    await refreshPage();
  }

  @action
  Future<void> updateAccount() async {
    try {
      final userData = {
        "displayName": name.text,
        "bio": bio.text,
        "birthday": date.text,
      };
      await updateUserData.updateUserData(userData, image);
    } on Exception catch (e) {
      Fluttertoast.showToast(
        msg: '$e',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.deepPurple,
      );
    }
  }

  @action
  Future<void> deleteProfileImage() async {
    await removeProfileImage.removeProfileImage();
    await updateAccount();
    await refreshPage();
  }

  @action
  Future<void> refreshPage() async {
    user = getUserData.getUserData().asObservable();
  }
}
