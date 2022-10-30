import 'package:injectable/injectable.dart';
import 'package:temparty/app/repositories/user_repository.dart';

@singleton
class RemoveProfileImage {
  final UserRepository _userRepository;

  RemoveProfileImage(this._userRepository);

  Future<void> removeProfileImage() async {
    await _userRepository.removeProfileImage();
  }
}
