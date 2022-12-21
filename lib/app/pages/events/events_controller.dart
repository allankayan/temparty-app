import 'package:mobx/mobx.dart';
import 'package:temparty/app/data/model/event_model.dart';
import 'package:temparty/app/data/model/user_model.dart';
import 'package:temparty/app/data/use_cases/event/get_event_list.dart';
import 'package:temparty/app/data/use_cases/user/get_user_data.dart';
import 'package:temparty/dir/dir.dart';

part 'events_controller.g.dart';

class EventsController = _EventsControllerBase with _$EventsController;

abstract class _EventsControllerBase with Store {
  final getUserData = getIt.get<GetUserData>();
  final getEventList = getIt.get<GetEventList>();

  @observable
  late ObservableFuture<UserModel> user = getUserData.getUserData().asObservable();

  @observable
  late ObservableFuture<List<EventModel>> events = getEventList.getEventList().asObservable();

  @action
  Future<void> refreshPage() async {
    user = getUserData.getUserData().asObservable();
  }
}
