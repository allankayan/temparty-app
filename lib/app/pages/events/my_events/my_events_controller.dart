import 'package:mobx/mobx.dart';
import 'package:temparty/app/data/model/event_model.dart';
import 'package:temparty/app/data/model/user_model.dart';
import 'package:temparty/app/data/use_cases/event/get_events_by_organizer_uid.dart';
import 'package:temparty/app/data/use_cases/user/get_user_data.dart';
import 'package:temparty/dir/dir.dart';

part 'my_events_controller.g.dart';

class MyEventsController = _MyEventsControllerBase with _$MyEventsController;

abstract class _MyEventsControllerBase with Store {
  final getEventsByOrganizerUid = getIt.get<GetEventsByOrganizerUid>();
  final getUserData = getIt.get<GetUserData>();
  late String organizerUid;

  _MyEventsControllerBase(this.organizerUid);

  @observable
  late ObservableFuture<UserModel> user = getUserData.getUserData().asObservable();

  @observable
  late ObservableFuture<List<EventModel>> events =
      getEventsByOrganizerUid.getEventsByOrganizerUid(organizerUid).asObservable();

  @action
  Future<void> refreshPage() async {
    events = getEventsByOrganizerUid.getEventsByOrganizerUid(organizerUid).asObservable();
  }
}
