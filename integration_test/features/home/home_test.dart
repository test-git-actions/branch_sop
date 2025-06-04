import 'package:branch_links/core/links/screens/links_list.dart';
import 'package:branch_links/core/screens/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/startup.dart';

void main() {
  testWidgets(
    'should navigate to home screen, should have an app bar with "Home Links" '
    'string, should have a search bar with "Search Home links" hint, '
    'and have a list of items',
    (tester) async {
      // setup app
      await setupApp();
      await tester.pumpWidget(const MyApp());

      // Check if Home tile exists
      expect(find.text('Home'), findsOneWidget);

      // Navigate to Home page
      await tester.tap(find.text('Home'));
      await tester.pump(const Duration(milliseconds: 100));

      // check if loader is visible
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();

      // check if app bar title is visible
      expect(find.text('Home links'), findsOneWidget);

      // check if there is a SearchBar
      expect(find.byType(SearchBar), findsOneWidget);

      // check if the search bar hint is visible
      expect(find.text('Search home links'), findsOneWidget);

      // check if there is a list of links
      expect(find.byType(LinksList), findsWidgets);

      // check if filter is working
      await tester.enterText(find.byType(SearchBar), 'Home');
      await tester.pump();

      expect(find.byIcon(Icons.close), findsOneWidget);

      // check if the close icon is hidden after clicking in it
      await tester.tap(find.byIcon(Icons.close));
      await tester.pump();
      expect(find.byIcon(Icons.close), findsNothing);

      // Check if there is a CopyButton
      expect(find.byKey(const Key('CopyButton')), findsAtLeastNWidgets(1));

      // Check if CopyButton is working
      await tester.tap(find.byKey(const Key('CopyButton')).first);
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text('Deep Link copied!'), findsOneWidget);

      // Check if there is a AddLinkButton
      expect(find.byKey(const Key('AddLinkButton')), findsAtLeastNWidgets(1));
      await tester.tap(find.byKey(const Key('AddLinkButton')).first);
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();
      expect(find.text('Generate link'), findsOneWidget);
    },
  );
}
