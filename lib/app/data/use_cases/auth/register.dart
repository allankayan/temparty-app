import 'package:injectable/injectable.dart';
import 'package:temparty/app/repositories/auth_repository.dart';

@singleton
class Register {
  final AuthRepository _authRepository;

  Register(this._authRepository);

  Future<void> register(email, name, date, password) async {
    await _authRepository.register(email, name, date, password);
  }
}
