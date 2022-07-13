import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_provider_decision/src/main_screen.dart';

void main() {
  group('back button and next question tests', () {
    testWidgets(
      "back button disabled at start",
      (widgetTester) async {
        await widgetTester.pumpWidget(const ProviderScope(child: MainScreen()));

        final firstQuestionFinder =
            find.text("Are the state's values from a stream?");
        expect(firstQuestionFinder, findsOneWidget);
        expect(find.byKey(const Key("backButton")), findsOneWidget);

        await widgetTester.tap(find.byKey(const Key("backButton")));

        expect(firstQuestionFinder, findsOneWidget);
      },
    );

    testWidgets(
      "back button enabled after on second question",
      (widgetTester) async {
        await widgetTester.pumpWidget(const ProviderScope(child: MainScreen()));

        final firstQuestionFinder =
            find.text("Are the state's values from a stream?");
        final secondQuestionFinder =
            find.text("Is the state assigned asynchronously?");
        expect(firstQuestionFinder, findsOneWidget);
        expect(secondQuestionFinder, findsNothing);
        expect(find.byKey(const Key("No")), findsOneWidget);

        await widgetTester.tap(find.byKey(const Key("No")));
        await widgetTester.pump(const Duration(milliseconds: 100));
        expect(firstQuestionFinder, findsNothing);
        expect(secondQuestionFinder, findsOneWidget);

        expect(find.byKey(const Key("backButton")), findsOneWidget);
        await widgetTester.tap(find.byKey(const Key("backButton")));
        await widgetTester.pump(const Duration(milliseconds: 100));

        expect(firstQuestionFinder, findsOneWidget);
        expect(secondQuestionFinder, findsNothing);
      },
    );
  });
}
