import 'package:flutter_test/flutter_test.dart';
import 'package:temparty/app/pages/main/main_controller.dart';

void main() {
  late MainController store;

  setUpAll(() {
    store = MainController();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
