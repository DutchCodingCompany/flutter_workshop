// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_workshop/main.dart';
import 'package:flutter_workshop/widgets/your_own_widget.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import 'helpers/mock_beer_service.dart';

void main() {
  testWidgets('Your widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await mockNetworkImages(() async {
      await tester.pumpWidget(FlutterWorkshop(beerService: MockBeerService()));
      await tester.pumpAndSettle();

      int amountOfTaps = 3;

      for (int i = 0; i < amountOfTaps; i++) {
        // Tap the '+' icon and trigger a frame.
        await tester.tap(find.byIcon(Icons.add));
      }

      await tester.pumpAndSettle();

      expect(find.text('Flutter Workshop'), findsOneWidget);

      expect(find.text('Trashy Blonde'), findsOneWidget);

      expect(find.byType(YourOwnWidget), findsNWidgets(amountOfTaps));
    });
  });
}