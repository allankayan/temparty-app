import 'package:temparty/app/pages/splash/splash_page.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('SplashPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(const SplashPage(title: 'T'));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
