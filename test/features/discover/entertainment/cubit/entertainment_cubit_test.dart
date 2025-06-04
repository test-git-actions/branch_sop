import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/core/clients/api_client/api_failure.dart';
import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/data/filter/models/filter.dart';
import 'package:branch_links/features/analytics_keys/data/models/analytics_keys.dart';
import 'package:branch_links/features/discover/screens/entertainment/cubit/entertainment_cubit.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockLinksRepository extends Mock implements LinksRepository {}

void main() {
  late MockLinksRepository mockLinksRepository;

  setUp(() {
    mockLinksRepository = MockLinksRepository();
    GetIt.instance.registerLazySingleton<LinksRepository>(
      () => mockLinksRepository,
    );
  });

  tearDown(() => GetIt.instance.reset());

  group('setStartDate', () {
    blocTest(
      'should emit EntertainmentState.formData with the passed start date',
      build: () => EntertainmentCubit(),
      act: (cubit) => cubit.setStartDate(DateTime(2023, 10, 23)),
      expect: () =>
          [EntertainmentState.formData(startDate: DateTime(2023, 10, 23))],
    );

    blocTest(
      'should emit EntertainmentState.formData with startDate null',
      build: () => EntertainmentCubit(),
      act: (cubit) {
        cubit.setStartDate(DateTime(2023, 10, 23));
        cubit.setStartDate(null);
      },
      expect: () => [
        EntertainmentState.formData(startDate: DateTime(2023, 10, 23)),
        const EntertainmentState.formData(startDate: null),
      ],
    );
  });

  group('setEndDate', () {
    blocTest(
      'should emit EntertainmentState.formData with the passed end date',
      build: () => EntertainmentCubit(),
      act: (cubit) => cubit.setEndDate(DateTime(2023, 10, 23)),
      expect: () =>
          [EntertainmentState.formData(endDate: DateTime(2023, 10, 23))],
    );

    blocTest(
      'should emit EntertainmentState.formData with endDate null',
      build: () => EntertainmentCubit(),
      act: (cubit) {
        cubit.setEndDate(DateTime(2023, 10, 23));
        cubit.setEndDate(null);
      },
      expect: () => [
        EntertainmentState.formData(endDate: DateTime(2023, 10, 23)),
        const EntertainmentState.formData(endDate: null),
      ],
    );
  });

  group('setCategoriesFilters', () {
    final categoriesFilters = {
      const Filter(key: 'key', name: 'name', filterType: FilterType.tag),
    };

    blocTest(
      'should emit EntertainmentState.formData with the passed categories filters',
      build: () => EntertainmentCubit(),
      act: (cubit) => cubit.setCategoriesFilters(categoriesFilters),
      expect: () => [
        EntertainmentState.formData(
          selectedCategoriesFilters: categoriesFilters,
        ),
      ],
    );
  });

  group('setProperties', () {
    final tProperties = [const Property(id: 'id', name: 'name')];

    blocTest(
      'should emit EntertainmentState.formData with the passed properties',
      build: () => EntertainmentCubit(),
      act: (cubit) => cubit.setProperties(tProperties.toSet()),
      expect: () => [
        EntertainmentState.formData(selectedProperties: tProperties.toSet()),
      ],
    );
  });

  group('createLink', () {
    const tProperties = [
      Property(id: 'id1', name: 'name'),
      Property(id: 'id2', name: 'name'),
    ];
    const tCategories = [
      Filter(key: 'Category1', name: 'name', filterType: FilterType.tag),
      Filter(key: 'Category2', name: 'name', filterType: FilterType.tag),
    ];
    final tStartDate = DateTime(2023, 11, 2);
    final tEndDate = DateTime(2023, 11, 3);

    const tDeepLinkURL = 'deepLinkURL';

    const tAnalyticsKeys = AnalyticsKeys(
      platformOrigin: 'platformOrigin',
      campaign: 'campaign',
      utmMedium: 'utmMedium',
      creativeName: 'creativeName',
      keyword: 'keyword',
      site: 'site',
    );
    const tAdobeDeepLinkParameter = 'test-adobe-deep-link-parameter';

    void setUpSuccessfulRepositoryCall() {
      when(
        () => mockLinksRepository.createLink(
          deepLinkPath: any(named: 'deepLinkPath'),
          feature: any(named: 'feature'),
          metadata: any(named: 'metadata'),
          adobeParameter: any(named: 'adobeParameter'),
          analyticsKeys: any(named: 'analyticsKeys'),
        ),
      ).thenAnswer((_) async => const Right(tDeepLinkURL));
    }

    blocTest(
      'should call DeepLinkRepository.createLink with the correct parameters',
      build: () => EntertainmentCubit(),
      setUp: setUpSuccessfulRepositoryCall,
      seed: () => EntertainmentState.formData(
        selectedProperties: tProperties.toSet(),
        selectedCategoriesFilters: tCategories.toSet(),
        startDate: tStartDate,
        endDate: tEndDate,
      ),
      act: (cubit) => cubit.createLink(
        updateAnalyticsKeys: tAnalyticsKeys.toMap(),
        updatedAdobeDeepLinkParameter: tAdobeDeepLinkParameter,
      ),
      verify: (_) {
        final deepLinkPath = Uri(
          path: '/discover/entertainment',
          queryParameters: {
            'filter': 'Category1,Category2',
            'propertyId': 'id1,id2',
            'startDate': '2023/11/2',
            'endDate': '2023/11/3',
          },
        ).toString();

        verify(
          () => mockLinksRepository.createLink(
            deepLinkPath: deepLinkPath,
            feature: 'SOP',
            metadata: const OGMetadata(
              title: 'Entertainment',
            ),
            adobeParameter: any(named: 'adobeParameter'),
            analyticsKeys: any(named: 'analyticsKeys'),
          ),
        ).called(1);
      },
    );

    blocTest(
      'should emit in order [EntertainmentState.formData(deepLinkURL: null, isLoading: true, hasError: false), '
      'EntertainmentState.formData(deepLinkURL: String, isLoading: false)] when the call to repository is successful',
      build: () => EntertainmentCubit(),
      seed: () => const EntertainmentState.formData(
        deepLinkURL: 'deeplink',
        isLoading: false,
        errorMessage: 'Something went wrong.',
      ),
      setUp: setUpSuccessfulRepositoryCall,
      act: (cubit) => cubit.createLink(),
      expect: () => [
        const EntertainmentState.formData(
          deepLinkURL: null,
          isLoading: true,
          errorMessage: null,
        ),
        const EntertainmentState.formData(
          deepLinkURL: tDeepLinkURL,
          isLoading: false,
          metadata: OGMetadata(
            title: Constants.entertainment,
          ),
        ),
      ],
    );

    blocTest(
      'should emit in order [EntertainmentState.formData(deepLinkURL: null, isLoading: true, hasError: false), '
      'EntertainmentState.formData(isLoading: false, hasError: true)] when the call to repository is unsuccessful',
      build: () => EntertainmentCubit(),
      seed: () => const EntertainmentState.formData(
        deepLinkURL: 'deeplink',
        isLoading: false,
        errorMessage: 'Something went wrong.',
      ),
      setUp: () {
        when(
          () => mockLinksRepository.createLink(
            deepLinkPath: any(named: 'deepLinkPath'),
            feature: any(named: 'feature'),
            metadata: any(named: 'metadata'),
            adobeParameter: any(named: 'adobeParameter'),
            analyticsKeys: any(named: 'analyticsKeys'),
          ),
        ).thenAnswer(
          (_) async => const Left(
            ApiFailure.connectionError(errorMessage: 'Error message'),
          ),
        );
      },
      act: (cubit) => cubit.createLink(),
      expect: () => [
        const EntertainmentState.formData(
          deepLinkURL: null,
          isLoading: true,
          errorMessage: null,
        ),
        const EntertainmentState.formData(
          isLoading: false,
          errorMessage: 'Error message',
        ),
      ],
    );
  });
}
