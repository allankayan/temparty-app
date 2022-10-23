import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/model/user_model.dart';
import 'package:temparty/app/repositories/user_repository.dart';

@singleton
class GetUserData {
  final UserRepository _userRepository;

  GetUserData(this._userRepository);

  Future<UserModel> getUserData({void params}) async {
    var user = await _userRepository.getUserData();
    return user!;
  }
}
