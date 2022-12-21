import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:temparty/app/data/model/user_model.dart';
import 'package:temparty/app/data/use_cases/event/create_event.dart';
import 'package:temparty/app/data/use_cases/user/get_user_data.dart';
import 'package:temparty/dir/dir.dart';

part 'create_event_controller.g.dart';

class CreateEventController = _CreateEventControllerBase with _$CreateEventController;

abstract class _CreateEventControllerBase with Store {
  final getUserData = getIt.get<GetUserData>();
  final createEvent = getIt.get<CreateEvent>();

  @observable
  TextEditingController name = TextEditingController();

  @observable
  TextEditingController address = TextEditingController();

  @observable
  TextEditingController city = TextEditingController();

  @observable
  TextEditingController observations = TextEditingController();

  @observable
  TextEditingController zipcode = MaskedTextController(mask: '00000-000');

  @observable
  TextEditingController date = MaskedTextController(mask: '00/00/0000');

  @observable
  XFile? profileImage;

  @observable
  XFile? headerImage;

  @observable
  late ObservableFuture<UserModel> user = getUserData.getUserData().asObservable();

  @observable
  RoundedLoadingButtonController btnController = RoundedLoadingButtonController();

  final ImagePicker picker = ImagePicker();

  @action
  Future imageFromGallery(String imageType) async {
    final file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null && imageType == 'profileImage') profileImage = file;
    if (file != null && imageType == 'headerImage') headerImage = file;
  }

  @action
  Future imageFromCamera(String imageType) async {
    final file = await picker.pickImage(source: ImageSource.camera);

    if (file != null && imageType == 'profileImage') profileImage = file;
    if (file != null && imageType == 'headerImage') headerImage = file;
  }

  @action
  Future<void> newEvent() async {
    btnController.start();

    if (profileImage != null && headerImage != null) {
      if (name.text != "" &&
          address.text != "" &&
          city.text != "" &&
          zipcode.text != "" &&
          date.text != "") {
        try {
          final eventData = {
            "name": name.text,
            "placeAddress": address.text,
            "placeCity": city.text,
            "placeZipcode": zipcode.text,
            "observations": observations.text,
            "date": date.text,
            "organizerUid": user.value!.userUid!,
          };
          await createEvent.createEvent(eventData, profileImage, headerImage);
          btnController.success();
        } on Exception catch (e) {
          btnController.error();
          Fluttertoast.showToast(
            msg: '$e',
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Colors.deepPurple,
          );
        }
      } else {
        btnController.stop();
        await Fluttertoast.showToast(
          msg: 'Preencha todas informações do evento',
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.redAccent,
        );
      }
    } else {
      btnController.stop();
      await Fluttertoast.showToast(
        msg: 'A foto e a capa do evento são obrigatórias. Você poderá mudar depois.',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.redAccent,
      );
    }
  }
}
