import 'package:flutter_test/flutter_test.dart';
import 'package:temparty/app/pages/search/search_controller.dart';

void main() {
  late SearchController store;

  setUpAll(() {
    store = SearchController();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
