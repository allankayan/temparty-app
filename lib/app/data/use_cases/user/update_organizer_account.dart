import 'package:injectable/injectable.dart';
import 'package:temparty/app/repositories/user_repository.dart';

@singleton
class UpdateOrganizerAccount {
  final UserRepository _userRepository;

  UpdateOrganizerAccount(this._userRepository);

  Future<void> updateOrganizerAccount(bool? value) async {
    await _userRepository.updateOrganizerAccount(value);
  }
}
