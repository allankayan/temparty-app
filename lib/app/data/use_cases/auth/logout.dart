import 'package:injectable/injectable.dart';
import 'package:temparty/app/repositories/auth_repository.dart';

@singleton
class Logout {
  final AuthRepository _authRepository;

  Logout(this._authRepository);

  Future<void> logout() async {
    await _authRepository.logout();
  }
}
