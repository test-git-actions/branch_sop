import 'package:branch_links/core/screens/my_app.dart';
import 'package:branch_links/core/links/screens/links_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/startup.dart';

void main() {
  testWidgets('show clubs list and SearchBar', (widgetTester) async {
    await setupApp();
    // Load app widget.
    await widgetTester.pumpWidget(const MyApp());

    // Navigate to Discover page
    final discoverTile = find.text('Discover');
    await widgetTester.tap(discoverTile);
    await widgetTester.pumpAndSettle();

    // Finds the list tile for clubs
    final clubItem = find.text('Clubs');

    // Emulate a tap on the club list tile.
    await widgetTester.tap(clubItem);
    await widgetTester.pump(const Duration(seconds: 1));

    // Check if the progress indicator is shown
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Trigger a frame.
    await widgetTester.pumpAndSettle();

    // Check if the list is shown
    expect(find.byType(LinksList), findsOneWidget);

    // Check if the list contains the club 'Lounge'
    await widgetTester.enterText(find.byType(SearchBar), 'Lounge');
    await widgetTester.pump();

    // Check if the Icons.close is shown
    expect(find.byIcon(Icons.close), findsOneWidget);

    // Tap on the Icons.close
    await widgetTester.tap(find.byIcon(Icons.close));
    await widgetTester.pump();

    // Check if the Icons.close is not shown
    expect(find.byIcon(Icons.close), findsNothing);
  });
}
