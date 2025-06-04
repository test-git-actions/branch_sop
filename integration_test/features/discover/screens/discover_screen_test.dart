import 'package:branch_links/core/screens/my_app.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/startup.dart';

void main() {
  testWidgets(
    'should navigate to discover screen',
    (tester) async {
      await setupApp();

      await tester.pumpWidget(const MyApp());
      // Navigate to Discover page
      await tester.tap(find.text('Discover'));
      await tester.pumpAndSettle();

      await tester.pump(const Duration(milliseconds: 100));
    },
  );
}
