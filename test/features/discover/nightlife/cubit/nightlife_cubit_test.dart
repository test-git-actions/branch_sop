import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/core/clients/api_client/api_failure.dart';
import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/data/filter/models/filter.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:branch_links/features/analytics_keys/data/models/analytics_keys.dart';
import 'package:branch_links/features/discover/screens/nightlife/cubit/nightlife_cubit.dart';
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

  group('setNightlifeCategoriesFilters', () {
    final nightlifeCategoriesFilters = {
      const Filter(key: 'key', name: 'name', filterType: FilterType.tag),
    };

    blocTest(
      'should emit NightlifeState.formData with the passed meal type filters',
      build: () => NightlifeCubit(),
      act: (cubit) =>
          cubit.setNightlifeCategoriesFilters(nightlifeCategoriesFilters),
      expect: () => [
        NightlifeState.formData(
          selectedNightlifeCategoriesFilters: nightlifeCategoriesFilters,
        ),
      ],
    );
  });

  group('setProperties', () {
    final tProperties = [const Property(id: 'id', name: 'name')];

    blocTest(
      'should emit NightlifeState.formData with the passed properties',
      build: () => NightlifeCubit(),
      act: (cubit) => cubit.setProperties(tProperties.toSet()),
      expect: () =>
          [NightlifeState.formData(selectedProperties: tProperties.toSet())],
    );
  });

  group('createLink', () {
    const tProperties = [
      Property(id: 'id1', name: 'name'),
      Property(id: 'id2', name: 'name'),
    ];
    const tNightlifeCategoriesFilters = [
      Filter(key: 'Nightlife1', name: 'name', filterType: FilterType.tag),
      Filter(key: 'Nightlife2', name: 'name', filterType: FilterType.tag),
    ];

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
      build: () => NightlifeCubit(),
      setUp: setUpSuccessfulRepositoryCall,
      seed: () => NightlifeState.formData(
        selectedProperties: tProperties.toSet(),
        selectedNightlifeCategoriesFilters: tNightlifeCategoriesFilters.toSet(),
      ),
      act: (cubit) => cubit.createLink(
        tAnalyticsKeys.toMap(),
        tAdobeDeepLinkParameter,
      ),
      verify: (_) {
        final deepLinkPath = Uri(
          path: '/discover/nightlife',
          queryParameters: {
            'filter': 'Nightlife1,Nightlife2',
            'propertyId': 'id1,id2',
          },
        ).toString();

        verify(
          () => mockLinksRepository.createLink(
            deepLinkPath: deepLinkPath,
            feature: 'SOP',
            metadata: const OGMetadata(
              title: 'Nightlife',
            ),
            adobeParameter: any(named: 'adobeParameter'),
            analyticsKeys: any(named: 'analyticsKeys'),
          ),
        ).called(1);
      },
    );

    blocTest(
      'should emit in order [NightlifeState.formData(deepLinkURL: null, isLoading: true, hasError: false), '
      'NightlifeState.formData(deepLinkURL: String, isLoading: false)] when the call to repository is successful',
      build: () => NightlifeCubit(),
      seed: () => const NightlifeState.formData(
        deepLinkURL: 'deeplink',
        isLoading: false,
        errorMessage: 'Something went wrong.',
      ),
      setUp: setUpSuccessfulRepositoryCall,
      act: (cubit) => cubit.createLink(
        tAnalyticsKeys.toMap(),
        tAdobeDeepLinkParameter,
      ),
      expect: () => [
        const NightlifeState.formData(
          deepLinkURL: null,
          isLoading: true,
          errorMessage: null,
        ),
        const NightlifeState.formData(
          deepLinkURL: tDeepLinkURL,
          isLoading: false,
          metadata: OGMetadata(
            title: Constants.nightlife,
          ),
        ),
      ],
    );

    blocTest(
      'should emit in order [NightlifeState.formData(deepLinkURL: null, isLoading: true, hasError: false), '
      'NightlifeState.formData(isLoading: false, hasError: true)] when the call to repository is unsuccessful',
      build: () => NightlifeCubit(),
      seed: () => const NightlifeState.formData(
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
      act: (cubit) => cubit.createLink(
        tAnalyticsKeys.toMap(),
        tAdobeDeepLinkParameter,
      ),
      expect: () => [
        const NightlifeState.formData(
          deepLinkURL: null,
          isLoading: true,
          errorMessage: null,
        ),
        const NightlifeState.formData(
          isLoading: false,
          errorMessage: 'Error message',
        ),
      ],
    );
  });
}
