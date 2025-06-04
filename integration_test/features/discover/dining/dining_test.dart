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
    'should navigate to dining screen, fill the form and create a deep link',
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

      // Navigate to Dining page
      final diningTile = find.text('Dining');
      await tester.tap(diningTile);
      await tester.pump(const Duration(milliseconds: 100));

      // check if the loaders for markets and properties are visible
      expect(find.byType(CircularProgressIndicator), findsNWidgets(2));

      await tester.pumpAndSettle();

      // check if app bar title is visible
      expect(find.text('Dining'), findsOneWidget);

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

      // check if meals selection is working
      final mealsOptionsWidget = find.byKey(const Key('MealsOptionsWidget'));
      expect(mealsOptionsWidget, findsOneWidget);
      expect(find.text('Tags - Meals (optional)'), findsOneWidget);
      await tester.dragUntilVisible(
        mealsOptionsWidget,
        scrollableFinder,
        const Offset(0, -100),
        maxIteration: 100,
      );
      await tester.pumpAndSettle();
      await tester.tap(mealsOptionsWidget);
      await tester.pumpAndSettle();
      final mealsOptions = find.byType(CheckboxListTile);
      await tester.tap(mealsOptions.at(0));
      await tester.tap(mealsOptions.at(1));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      expect(find.byType(ChoiceChip), findsNWidgets(4));

      // check if cuisines selection is working
      final cuisinesOptionsWidget =
          find.byKey(const Key('CuisinesOptionsWidget'));
      expect(cuisinesOptionsWidget, findsOneWidget);
      expect(find.text('Tags - Cuisines (optional)'), findsOneWidget);
      await tester.dragUntilVisible(
        cuisinesOptionsWidget,
        scrollableFinder,
        const Offset(0, -100),
        maxIteration: 100,
      );
      await tester.tap(cuisinesOptionsWidget);
      await tester.pumpAndSettle();
      final cuisineOptions = find.byType(CheckboxListTile);
      await tester.tap(cuisineOptions.at(0));
      await tester.tap(cuisineOptions.at(1));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      expect(find.byType(ChoiceChip), findsNWidgets(6));

      // check if prices selection is working
      final pricesOptionsWidget = find.byKey(const Key('PricesOptionsWidget'));
      expect(pricesOptionsWidget, findsOneWidget);
      expect(find.text('Tags - Prices (optional)'), findsOneWidget);
      await tester.dragUntilVisible(
        pricesOptionsWidget,
        scrollableFinder,
        const Offset(0, -100),
        maxIteration: 100,
      );
      await tester.tap(pricesOptionsWidget);
      await tester.pumpAndSettle();
      final pricesOptions = find.byType(CheckboxListTile);
      await tester.tap(pricesOptions.at(0));
      await tester.tap(pricesOptions.at(1));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      expect(find.byType(ChoiceChip), findsNWidgets(8));

      // check if dining options selection is working
      final diningOptionsWidget = find.byKey(const Key('DiningOptionsWidget'));
      expect(diningOptionsWidget, findsOneWidget);
      expect(find.text('Dining options'), findsOneWidget);
      await tester.dragUntilVisible(
        diningOptionsWidget,
        scrollableFinder,
        const Offset(0, -100),
        maxIteration: 100,
      );
      await tester.tap(diningOptionsWidget);
      await tester.pumpAndSettle();
      final diningOptions = find.byType(CheckboxListTile);
      await tester.tap(diningOptions.at(0));
      await tester.tap(diningOptions.at(1));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      expect(find.byType(ChoiceChip), findsNWidgets(3));

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
