import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/model/user_model.dart';
import 'package:temparty/app/repositories/user_repository.dart';

@singleton
class GetUser {
  final UserRepository _userRepository;

  GetUser(this._userRepository);

  Future<UserModel> getUser({void params}) async {
    var user = await _userRepository.getUser();
    return user!;
  }
}
