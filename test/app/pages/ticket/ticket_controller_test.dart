import 'package:flutter_test/flutter_test.dart';
import 'package:temparty/app/pages/ticket/ticket_controller.dart';

void main() {
  late TicketController store;

  setUpAll(() {
    store = TicketController();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
