import 'package:mobx/mobx.dart';
import 'package:temparty/app/data/model/user_model.dart';
import 'package:temparty/app/data/use_cases/user/get_user_data.dart';
import 'package:temparty/dir/dir.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final getUserData = getIt.get<GetUserData>();

  @observable
  late ObservableFuture<UserModel> user = getUserData.getUserData().asObservable();
}
