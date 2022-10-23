import 'package:injectable/injectable.dart';
import 'package:temparty/app/repositories/auth_repository.dart';

@singleton
class Login {
  final AuthRepository _authRepository;

  Login(this._authRepository);

  Future<void> login(email, password) async {
    await _authRepository.login(email, password);
  }
}
