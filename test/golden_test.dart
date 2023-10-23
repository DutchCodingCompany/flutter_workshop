import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_workshop/main.dart';
import 'package:flutter_workshop/theming/workshop_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import 'helpers/mock_beer_service.dart';

void main() {
  setUp(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('Full App golden test ', (WidgetTester tester) async {
    await mockNetworkImages(() async {
      await tester.pumpWidget(FlutterWorkshop(beerService: MockBeerService()));
      await tester.pumpAndSettle();

      int amountOfTaps = 3;

      for (int i = 0; i < amountOfTaps; i++) {
        // Tap the '+' icon and trigger a frame.
        await tester.tap(find.byIcon(Icons.add));
      }
      await tester.pumpAndSettle();

      await expectLater(find.byType(FlutterWorkshop), matchesGoldenFile('full_app_golden_test.png'));
    });
  });

  testWidgets('Your widget golden test ', (WidgetTester tester) async {
    await mockNetworkImages(() async {
      // Step 4: Add your own widget golden test here!

      await tester.pumpWidget(testWrapper(child: Container() // Replace this container with your own widget

          ));
      await tester.pumpAndSettle(); // We do this to wait for all the rendering to finish.

      // The widget should be finished rendering now. We need to do a 'expect' here and compare it with the golden file.
      // Implement that here!
    });
  });
}

Widget testWrapper({required Widget child}) {
  return MaterialApp(
    theme: WorkshopTheme.theme,
    home: Scaffold(
      body: child,
    ),
  );
}
