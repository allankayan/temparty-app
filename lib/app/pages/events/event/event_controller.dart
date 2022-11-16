import 'package:mobx/mobx.dart';
import 'package:temparty/app/data/model/event_model.dart';
import 'package:temparty/app/data/model/user_model.dart';
import 'package:temparty/app/data/use_cases/event/get_event_by_uid.dart';
import 'package:temparty/app/data/use_cases/user/get_user_data.dart';
import 'package:temparty/dir/dir.dart';

part 'event_controller.g.dart';

class EventController = _EventControllerBase with _$EventController;

abstract class _EventControllerBase with Store {
  late String uid;

  final _getEvent = getIt.get<GetEventByUid>();
  final getUserData = getIt.get<GetUserData>();

  _EventControllerBase(this.uid);

  @observable
  late ObservableFuture<EventModel> event = _getEvent.getEventByUid(eventUid: uid).asObservable();

  @observable
  late ObservableFuture<UserModel> user = getUserData.getUserData().asObservable();
}
