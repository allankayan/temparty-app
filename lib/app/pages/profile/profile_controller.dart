import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:temparty/app/data/model/user_model.dart';
import 'package:temparty/app/data/use_cases/auth/logout.dart';
import 'package:temparty/app/data/use_cases/user/get_user_data.dart';
import 'package:temparty/dir/dir.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final logout = getIt.get<Logout>();
  final getUserData = getIt.get<GetUserData>();

  @observable
  late ObservableFuture<UserModel> user = getUserData.getUserData().asObservable();

  @action
  Future<void> signOut() async {
    await logout.logout();
    Modular.to.pushReplacementNamed('/login');
  }
}
