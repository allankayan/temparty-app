import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:temparty/app/data/model/event_model.dart';
import 'package:temparty/app/data/model/ticket_model.dart';
import 'package:temparty/app/data/use_cases/ticket/get_tickets_by_user_uid.dart';
import 'package:temparty/dir/dir.dart';

part 'tickets_controller.g.dart';

class TicketsController = _TicketsControllerBase with _$TicketsController;

abstract class _TicketsControllerBase with Store {
  final currentUser = FirebaseAuth.instance.currentUser;
  final getTicketsByUserUid = getIt.get<GetTicketsByUserUid>();

  @observable
  late ObservableList<EventModel> events = ObservableList<EventModel>();

  @observable
  late ObservableFuture<List<TicketModel>> tickets =
      getTicketsByUserUid.getTicketsByUserUid(currentUser!.uid).asObservable();
}
