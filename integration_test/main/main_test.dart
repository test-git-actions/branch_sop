import 'package:branch_links/core/screens/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/startup.dart';

void main() {
  testWidgets(
      'should edit the environment and check the selected environment into discover screen',
      (tester) async {
    await setupApp();
    // Show MyApp Widget
    await tester.pumpWidget(const MyApp());

    // check if environment selection is working
    expect(find.text('UAT').hitTestable(), findsOneWidget);
    await tester.tap(find.text('UAT').hitTestable());
    await tester.pumpAndSettle();
    await tester.tap(find.text('PREPROD').hitTestable());
    await tester.pumpAndSettle();
    expect(find.text('PREPROD').hitTestable(), findsOneWidget);

    // Navigate to Discover page
    await tester.tap(find.text('Discover'));
    await tester.pumpAndSettle();
    expect(find.text('PREPROD'), findsOneWidget);

    // Back to main screen
    expect(find.byType(BackButtonIcon).hitTestable(), findsOneWidget);
    await tester.tap(find.byType(BackButtonIcon).hitTestable());
    await tester.pumpAndSettle();

    // check if environment selection is working
    expect(find.text('PREPROD').hitTestable(), findsOneWidget);
    await tester.tap(find.text('PREPROD').hitTestable());
    await tester.pumpAndSettle();
    await tester.tap(find.text('QA4').hitTestable());
    await tester.pumpAndSettle();
    expect(find.text('QA4').hitTestable(), findsOneWidget);

    // Navigate to Discover page
    await tester.tap(find.text('Discover'));
    await tester.pumpAndSettle();
    expect(find.text('QA4'), findsOneWidget);
  });
}
