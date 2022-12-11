import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:temparty/app/data/model/event_model.dart';
import 'package:temparty/app/data/model/user_model.dart';
import 'package:temparty/app/data/use_cases/event/get_event_by_uid.dart';
import 'package:temparty/app/data/use_cases/ticket/create_ticket.dart';
import 'package:temparty/app/data/use_cases/user/get_user_data.dart';
import 'package:temparty/dir/dir.dart';

part 'event_controller.g.dart';

class EventController = _EventControllerBase with _$EventController;

abstract class _EventControllerBase with Store {
  late String uid;

  final _getEvent = getIt.get<GetEventByUid>();
  final getUserData = getIt.get<GetUserData>();
  final createTicket = getIt.get<CreateTicket>();

  _EventControllerBase(this.uid);

  @observable
  late ObservableFuture<EventModel> event = _getEvent.getEventByUid(eventUid: uid).asObservable();

  @observable
  late ObservableFuture<UserModel> user = getUserData.getUserData().asObservable();

  @action
  Future<void> refreshPage() async {
    event = _getEvent.getEventByUid(eventUid: uid).asObservable();
  }

  @action
  Future<void> newTicket() async {
    try {
      final ticketData = {
        "userUid": user.value!.userUid!,
        "eventUid": event.value!.eventUid!,
        "eventName": event.value!.name!,
        "eventBanner": event.value!.headerImage!,
        "eventDate": event.value!.date!,
      };

      await createTicket.createTicket(ticketData);
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
