import 'dart:math';

import 'package:branch_links/core/constants/endpoints.dart';
import 'package:branch_links/core/screens/my_app.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/startup.dart';

class MockLinksRepository extends Mock implements LinksRepository {}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
      ),
    );

void main() {
  late MockLinksRepository mockLinksRepository;

  setUp(() {
    mockLinksRepository = MockLinksRepository();
  });

  testWidgets(
    'should navigate to nightlife screen, fill the form and create a deep link',
    (tester) async {
      // setup app
      await setupApp();

      // override deep link repository
      GetIt.instance.allowReassignment = true;
      GetIt.instance.registerLazySingleton<LinksRepository>(
        () => mockLinksRepository,
      );

      final deepLinkURL = '${Endpoints.deepLink}/${getRandomString(8)}';

      when(
        () => mockLinksRepository.createLink(
          deepLinkPath: any(named: 'deepLinkPath'),
          feature: any(named: 'feature'),
          alias: any(named: 'alias'),
          metadata: any(named: 'metadata'),
        ),
      ).thenAnswer(
        (_) async {
          await Future.delayed(const Duration(seconds: 2));
          return Right(deepLinkURL);
        },
      );

      await tester.pumpWidget(const MyApp());

      // Navigate to Discover page
      final discoverTile = find.text('Discover');
      await tester.tap(discoverTile);
      await tester.pumpAndSettle();

      // Navigate to Nightlife page
      final nightlifeTile = find.text('Nightlife');
      await tester.tap(nightlifeTile);
      await tester.pump(const Duration(milliseconds: 100));

      // check if the loaders for markets and properties are visible
      expect(find.byType(CircularProgressIndicator), findsNWidgets(2));

      await tester.pumpAndSettle();

      // check if app bar title is visible
      expect(find.text('Nightlife'), findsOneWidget);

      // find the scrollable area
      final scrollableFinder = find.byType(SingleChildScrollView);

      // check if adobe deep link id is working
      final deepLinkTextField =
          find.byKey(const Key('AdobeDeepLinkParameterID'));
      expect(deepLinkTextField, findsOneWidget);
      await tester.enterText(deepLinkTextField, 'Deep Link ID');
      await tester.pump();
      expect(find.text('Deep Link ID'), findsOneWidget);

      // check if markets selection is working
      final marketsOptionsWidget =
          find.byKey(const Key('MarketsOptionsWidget'));
      expect(marketsOptionsWidget, findsOneWidget);
      expect(find.text('Markets (optional)'), findsOneWidget);
      await tester.tap(marketsOptionsWidget);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Las Vegas').last);
      await tester.pumpAndSettle();
      expect(find.text('Las Vegas').hitTestable(), findsOneWidget);

      // check if properties selection is working
      final propertiesOptionsWidget =
          find.byKey(const Key('PropertiesOptionsWidget'));
      expect(propertiesOptionsWidget, findsOneWidget);
      expect(find.text('Properties (optional)'), findsOneWidget);
      await tester.dragUntilVisible(
        propertiesOptionsWidget,
        scrollableFinder,
        const Offset(0, -100),
        maxIteration: 100,
      );
      await tester.pumpAndSettle();
      await tester.tap(propertiesOptionsWidget);
      await tester.pumpAndSettle();
      final propertiesOptions = find.byType(CheckboxListTile);
      await tester.tap(propertiesOptions.at(0));
      await tester.tap(propertiesOptions.at(1));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      expect(find.byType(ChoiceChip), findsNWidgets(2));

      // check if category selection is working
      final categoriesOptionsWidget =
          find.byKey(const Key('NightlifeCategoriesOptionsWidget'));
      expect(categoriesOptionsWidget, findsOneWidget);
      expect(find.text('Tags - Category (optional)'), findsOneWidget);
      await tester.dragUntilVisible(
        categoriesOptionsWidget,
        scrollableFinder,
        const Offset(0, -100),
        maxIteration: 100,
      );
      await tester.pumpAndSettle();
      await tester.tap(categoriesOptionsWidget);
      await tester.pumpAndSettle();
      final categoryOptions = find.byType(CheckboxListTile);
      await tester.tap(categoryOptions.at(0));
      await tester.tap(categoryOptions.at(1));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      expect(find.byType(ChoiceChip), findsNWidgets(4));

      // check if deep link generation is working
      final generateButton = find.byType(OutlinedButton);
      expect(generateButton, findsOneWidget);
      expect(find.text('Generate'), findsOneWidget);
      await tester.dragUntilVisible(
        generateButton,
        scrollableFinder,
        const Offset(0, -100),
        maxIteration: 100,
      );
      await tester.tap(generateButton);
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();

      // Check if deep link copy function is working
      final copyButton = find.byKey(const Key('CopyButton'));
      await tester.dragUntilVisible(
        copyButton,
        scrollableFinder,
        const Offset(0, -100),
        maxIteration: 100,
      );
      expect(find.text('Generated Deep Link'), findsOneWidget);
      expect(find.byType(SelectableText), findsOneWidget);
      expect(find.text(deepLinkURL), findsOneWidget);
      expect(find.byIcon(Icons.copy), findsOneWidget);
      expect(copyButton, findsOneWidget);
      await tester.tap(copyButton);
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Deep Link copied!'), findsOneWidget);
      await tester.pumpAndSettle();
    },
  );
}
