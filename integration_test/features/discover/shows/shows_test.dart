import 'package:branch_links/core/links/screens/links_list.dart';
import 'package:branch_links/core/screens/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/startup.dart';

void main() {
  testWidgets(
    'should navigate to shows screen, should have an app bar with "Shows" string and have a list of items',
    (tester) async {
      // setup app
      await setupApp();
      await tester.pumpWidget(const MyApp());

      // Navigate to Discover page
      final discoverTile = find.text('Discover');
      await tester.tap(discoverTile);
      await tester.pumpAndSettle();

      // Navigate to Shows page
      final showsTile = find.text('Shows');
      await tester.tap(showsTile);
      await tester.pump(const Duration(milliseconds: 100));

      // check if loader is visible
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();

      // check if app bar title is visible
      expect(find.text('Shows'), findsOneWidget);

      // check if there is a SearchBar
      expect(find.byType(SearchBar), findsOneWidget);

      // check if the search bar hint is visible
      expect(find.text('Search show'), findsOneWidget);

      // check if there is a list of shows
      expect(find.byType(LinksList), findsWidgets);

      // check if filter is working
      await tester.enterText(find.byType(SearchBar), 'Tournament');
      await tester.pump();

      expect(find.byIcon(Icons.close), findsOneWidget);

      // check if the close icon is hidden after clicking in it
      await tester.tap(find.byIcon(Icons.close));
      await tester.pump();
      expect(find.byIcon(Icons.close), findsNothing);
    },
  );
}
