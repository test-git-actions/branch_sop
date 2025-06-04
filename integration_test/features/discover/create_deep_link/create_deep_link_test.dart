import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/core/screens/my_app.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/startup.dart';

class MockDeepLinkRepository extends Mock implements LinksRepository {}

void main() {
  late MockDeepLinkRepository mockDeepLinkRepository;

  setUp(() {
    mockDeepLinkRepository = MockDeepLinkRepository();
  });

  testWidgets(
      'should navigate to create content link, fill the form and '
      'create a deep link', (tester) async {
    await setupApp();
    GetIt.instance.allowReassignment = true;
    GetIt.instance.registerLazySingleton<LinksRepository>(
      () => mockDeepLinkRepository,
    );

    when(
      () => mockDeepLinkRepository.createLink(
        deepLinkPath: any(named: 'deepLinkPath'),
        feature: any(named: 'feature'),
        alias: any(named: 'alias'),
        metadata: any(named: 'metadata'),
      ),
    ).thenAnswer(
      (_) async {
        await Future.delayed(const Duration(seconds: 2));
        return const Right('https://mgmresorts.app.link/1');
      },
    );

    // Show MyApp Widget
    await tester.pumpWidget(const MyApp());

    // Navigate to Discover page
    await tester.tap(find.text('Discover'));
    await tester.pumpAndSettle();

    // Navigate to Shows page
    await tester.tap(find.text('Shows'));
    await tester.pump(const Duration(milliseconds: 100));

    await tester.pumpAndSettle();

    // Navigate to Create Content Deep Link page
    await tester.tap(find.byKey(const Key('AddLinkButton')).first);
    await tester.pump(const Duration(milliseconds: 100));

    await tester.pumpAndSettle();

    // check if adobe deep link id is working
    expect(find.byKey(const Key('AdobeDeepLinkParameterID')), findsOneWidget);
    await tester.enterText(
      find.byKey(const Key('AdobeDeepLinkParameterID')),
      'Deep Link ID',
    );
    await tester.pump();
    expect(find.text('Deep Link ID'), findsOneWidget);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    // check if deep link generation is working
    expect(find.byType(OutlinedButton), findsOneWidget);
    expect(find.text('Create Content Link'), findsOneWidget);
    await tester.dragUntilVisible(
      find.byType(OutlinedButton),
      find.byType(SingleChildScrollView),
      const Offset(0, -100),
      maxIteration: 100,
    );
    await tester.tap(find.byType(OutlinedButton));
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();

    // Check if deep link copy function is working
    await tester.dragUntilVisible(
      find.byKey(const Key('CopyLinkButton')),
      find.byType(SingleChildScrollView),
      const Offset(0, -100),
      maxIteration: 100,
    );
    expect(find.byKey(const Key('GeneratedLink')), findsOneWidget);
    expect(find.byType(SelectableText), findsOneWidget);
    expect(find.text('https://mgmresorts.app.link/1'), findsOneWidget);
    expect(find.byIcon(Icons.copy), findsOneWidget);
    expect(find.byKey(const Key('CopyLinkButton')), findsOneWidget);
    await tester.tap(find.byKey(const Key('CopyLinkButton')));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('SnackBarText')), findsOneWidget);
    await tester.pumpAndSettle();
  });
}
