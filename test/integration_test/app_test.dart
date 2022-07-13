import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:riverpod_provider_decision/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets(
        'answering leads to result screen, go again back to first question',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const Key("Yes")), findsOneWidget);

      await tester.tap(find.byKey(const Key("Yes")));
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byKey(const Key("Yes")), findsNothing);
      expect(find.textContaining("Result: "), findsOneWidget);
      expect(find.text("go again"), findsOneWidget);

      await tester.tap(find.text("go again"));
      await tester.pump(const Duration(milliseconds: 100));

      final firstQuestionFinder =
          find.text("Are the state's values from a stream?");
      expect(firstQuestionFinder, findsOneWidget);
    });
  });
}
