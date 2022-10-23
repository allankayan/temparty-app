import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserLocalStorage {
  final FlutterSecureStorage _secureStorage;

  UserLocalStorage(this._secureStorage);

  Future<void> saveUserData(String userData) async {
    return await _secureStorage.write(key: 'user', value: userData);
  }

  Future<String?> getUserData() async {
    final data = await _secureStorage.read(key: 'user');
    return data;
  }

  Future<void> deleteUserData() {
    return _secureStorage.delete(key: 'user');
  }
}
