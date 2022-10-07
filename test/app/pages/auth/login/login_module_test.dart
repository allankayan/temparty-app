import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temparty/app/pages/auth/login/login_module.dart';

void main() {
  setUpAll(() {
    initModule(LoginModule());
  });
}
