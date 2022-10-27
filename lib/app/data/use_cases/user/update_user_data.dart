import 'package:injectable/injectable.dart';
import 'package:temparty/app/repositories/user_repository.dart';

@singleton
class UpdateUserData {
  final UserRepository _userRepository;

  UpdateUserData(this._userRepository);

  Future<void> updateUserData(Map<String, String> data) async {
    await _userRepository.updateUserData(data);
  }
}
