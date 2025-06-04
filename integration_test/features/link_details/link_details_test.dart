import 'dart:io';

import 'package:branch_links/core/constants/filters_constants.dart';
import 'package:branch_links/core/links/data/models/link_details.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/core/screens/my_app.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test/utils/mock_http_overrides.dart';
import '../../utils/startup.dart';

class MockLinksRepository extends Mock implements LinksRepository {}

void main() {
  late MockLinksRepository mockLinksRepository;

  setUp(() async {
    mockLinksRepository = MockLinksRepository();

    registerFallbackValue(Uri());
    final imageByteData = await rootBundle.load('assets/images/image.jpeg');
    final imageIntList = imageByteData.buffer.asInt8List();

    HttpOverrides.global = MockHttpOverrides(imageIntList);
  });

  testWidgets(
    'should navigate to link details screen, write any link and show the details from the link',
    (tester) async {
      // setup app
      await setupApp();

      // override deep link repository
      GetIt.instance.allowReassignment = true;
      GetIt.instance.registerLazySingleton<LinksRepository>(
        () => mockLinksRepository,
      );

      final tLinkDetails = LinkDetails(
        id: 'id',
        feature: 'SOP',
        deepLinkPath: Uri(
          path: '/discover/dining',
          queryParameters: {
            FilterConstants.filter: 'id1,id2',
            FilterConstants.propertyId: 'propertyId1, propertyId2',
          },
        ),
        metadata: const OGMetadata(
          title: 'Dining',
        ),
      );

      when(
        () => mockLinksRepository.getGeneratedLinkDetails(any()),
      ).thenAnswer(
        (_) async {
          await Future.delayed(const Duration(seconds: 2));
          return Right(tLinkDetails);
        },
      );

      await tester.pumpWidget(const MyApp());

      // check if Deep Link Inspector tile exists and navigate to the corresponding page
      final deepLinkInspectorTile = find.text('Deep Link Inspector');
      expect(deepLinkInspectorTile, findsOneWidget);
      await tester.tap(deepLinkInspectorTile);
      await tester.pumpAndSettle();

      // check if the app bar title is correct
      expect(find.text('Deep Link Inspector'), findsOneWidget);

      // check if there is a text form field and fill it with a link
      final linkTextField = find.byKey(const Key('LinkTextFormField'));
      expect(linkTextField, findsOneWidget);
      await tester.enterText(linkTextField, 'https://some-random-link.com');
      await tester.pump();
      expect(find.text('https://some-random-link.com'), findsOneWidget);

      // check if Get Details button exists and click
      final getDetailsButton = find.text('Get Details');
      expect(getDetailsButton, findsOneWidget);
      await tester.tap(getDetailsButton);
      await tester.pump(const Duration(milliseconds: 100));

      // check if loader is visible
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();

      // check if the link details are visible
      expect(find.text('Social Metadata'), findsOneWidget);
      expect(find.text('All Metadata'), findsOneWidget);
      expect(find.text('ID: ${tLinkDetails.id}'), findsOneWidget);
      expect(find.text('Feature: ${tLinkDetails.feature}'), findsOneWidget);
      expect(
        find.text(
          'Deep Link Path: ${Uri.decodeFull(tLinkDetails.deepLinkPath.toString())}',
        ),
        findsOneWidget,
      );
      for (var param in tLinkDetails.deepLinkPath.queryParameters.entries) {
        expect(
          find.text(
            '${toBeginningOfSentenceCase(param.key)}: ${Uri.decodeFull(param.value)}',
          ),
          findsOneWidget,
        );
      }
      expect(
        find.text('Title: ${tLinkDetails.metadata.title}'),
        findsOneWidget,
      );
      expect(
        find.text('Description: ${tLinkDetails.metadata.description}'),
        findsOneWidget,
      );
      expect(
        find.text('Image URL: ${tLinkDetails.metadata.imageURL}'),
        findsOneWidget,
      );
      expect(
        find.text('Image Height: ${tLinkDetails.metadata.imageHeight}'),
        findsOneWidget,
      );
      expect(
        find.text('Image Width: ${tLinkDetails.metadata.imageWidth}'),
        findsOneWidget,
      );
    },
  );
}
