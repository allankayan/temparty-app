import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:temparty/app/data/model/event_model.dart';
import 'package:temparty/app/data/model/user_model.dart';
import 'package:temparty/app/data/use_cases/event/get_event_by_uid.dart';
import 'package:temparty/app/data/use_cases/event/update_event.dart';
import 'package:temparty/app/data/use_cases/user/get_user_data.dart';
import 'package:temparty/dir/dir.dart';

part 'edit_event_controller.g.dart';

class EditEventController = _EditEventControllerBase with _$EditEventController;

abstract class _EditEventControllerBase with Store {
  late String uid;

  final _getEvent = getIt.get<GetEventByUid>();
  final getUserData = getIt.get<GetUserData>();
  final updateEvent = getIt.get<UpdateEvent>();

  _EditEventControllerBase(this.uid);

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
  RoundedLoadingButtonController btnController = RoundedLoadingButtonController();

  @observable
  late ObservableFuture<EventModel> event = _getEvent.getEventByUid(eventUid: uid).asObservable();

  @observable
  late ObservableFuture<UserModel> user = getUserData.getUserData().asObservable();

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
  Future<void> updateEventData() async {
    try {
      final eventData = {
        "eventUid": event.value!.eventUid!,
        "organizerUid": event.value!.organizerUid!,
        "name": name.text,
        "placeAddress": address.text,
        "placeCity": city.text,
        "placeZipcode": zipcode.text,
        "observations": observations.text,
        "date": date.text,
      };
      await updateEvent.updateEvent(eventData, profileImage, headerImage);
      Modular.to.pop();
    } on Exception catch (e) {
      Fluttertoast.showToast(
        msg: '$e',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.deepPurple,
      );
    }
  }
}
