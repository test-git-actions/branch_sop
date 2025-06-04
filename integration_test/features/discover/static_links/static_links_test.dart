import 'package:branch_links/core/screens/my_app.dart';
import 'package:branch_links/core/links/screens/links_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/startup.dart';

void main() {
  testWidgets(
    'should navigate to static links screen, should have an app bar with "Static Links" string and have a list of items',
    (tester) async {
      // setup app
      await setupApp();
      await tester.pumpWidget(const MyApp());

      // Navigate to Discover page
      final discoverTile = find.text('Discover');
      await tester.tap(discoverTile);
      await tester.pumpAndSettle();

      // Navigate to StaticLinks page
      final staticLinksTile = find.text('Static pages');
      await tester.tap(staticLinksTile);
      await tester.pump(const Duration(milliseconds: 100));

      // check if loader is visible
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();

      // check if app bar title is visible
      expect(find.text('Static links'), findsOneWidget);

      // check if there is a SearchBar
      expect(find.byType(SearchBar), findsOneWidget);

      // check if the search bar hint is visible
      expect(find.text('Search Discover links'), findsOneWidget);

      // check if there is a list of links
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
