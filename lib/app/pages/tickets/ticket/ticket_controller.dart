import 'package:mobx/mobx.dart';
import 'package:temparty/app/data/model/event_model.dart';
import 'package:temparty/app/data/model/ticket_model.dart';
import 'package:temparty/app/data/model/user_model.dart';
import 'package:temparty/app/data/use_cases/event/get_event_by_uid.dart';
import 'package:temparty/app/data/use_cases/ticket/get_ticket_by_uid.dart';
import 'package:temparty/app/data/use_cases/user/get_user_data.dart';
import 'package:temparty/dir/dir.dart';

part 'ticket_controller.g.dart';

class TicketController = _TicketControllerBase with _$TicketController;

abstract class _TicketControllerBase with Store {
  final Map<String, dynamic> data;
  late String uid;
  late String eventUid;

  final _getEvent = getIt.get<GetEventByUid>();
  final _getTicket = getIt.get<GetTicketByUid>();
  final getUserData = getIt.get<GetUserData>();

  _TicketControllerBase(this.uid, this.data) {
    eventUid = data["eventUid"];
  }

  @observable
  late ObservableFuture<UserModel> user = getUserData.getUserData().asObservable();

  @observable
  late ObservableFuture<TicketModel> ticket =
      _getTicket.getTicketByUid(ticketUid: uid).asObservable();

  @observable
  late ObservableFuture<EventModel> event =
      _getEvent.getEventByUid(eventUid: eventUid).asObservable();
}
