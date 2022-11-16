import 'package:mobx/mobx.dart';
import 'package:temparty/app/data/model/user_model.dart';
import 'package:temparty/app/data/use_cases/user/get_user_data.dart';
import 'package:temparty/dir/dir.dart';

part 'events_controller.g.dart';

class EventsController = _EventsControllerBase with _$EventsController;

abstract class _EventsControllerBase with Store {
  final getUserData = getIt.get<GetUserData>();

  @observable
  late ObservableFuture<UserModel> user = getUserData.getUserData().asObservable();

  @action
  Future<void> refreshPage() async {
    user = getUserData.getUserData().asObservable();
  }
}
