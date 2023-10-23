import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_workshop/beer/beer.dart';
import 'package:flutter_workshop/main.dart';
import 'package:flutter_workshop/theming/workshop_theme.dart';
import 'package:flutter_workshop/widgets/your_own_widget.dart';
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

      await tester.pumpWidget(testWrapper(
        child: const YourOwnWidget(
            beer: Beer(name: 'hallo', tagline: 'hallo2', description: 'hallo23', imageUrl: 'imageUrl', abv: 12)),
      ));
      await tester.pumpAndSettle();

      await expectLater(find.byType(YourOwnWidget), matchesGoldenFile('your_widget_golden_test.png'));
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
