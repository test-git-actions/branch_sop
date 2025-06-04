import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/core/clients/api_client/api_failure.dart';
import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/data/filter/models/filter.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:branch_links/features/analytics_keys/data/models/analytics_keys.dart';
import 'package:branch_links/features/discover/screens/dining/cubit/dining_cubit.dart';
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

  group('setMealTypeFilters', () {
    final mealFilters = {
      const Filter(key: 'key', name: 'name', filterType: FilterType.tag),
    };

    blocTest(
      'should emit DiningState.formData with the passed meal type filters',
      build: () => DiningCubit(),
      act: (cubit) => cubit.setMealTypeFilters(mealFilters),
      expect: () =>
          [DiningState.formData(selectedMealTypeFilters: mealFilters)],
    );
  });

  group('setCuisineFilters', () {
    final cuisineFilters = {
      const Filter(key: 'key', name: 'name', filterType: FilterType.tag),
    };

    blocTest(
      'should emit DiningState.formData with the passed cuisine filters',
      build: () => DiningCubit(),
      act: (cubit) => cubit.setCuisineFilters(cuisineFilters),
      expect: () =>
          [DiningState.formData(selectedCuisineFilters: cuisineFilters)],
    );
  });

  group('setPriceFilters', () {
    final priceFilters = {
      const Filter(key: 'key', name: 'name', filterType: FilterType.tag),
    };

    blocTest(
      'should emit DiningState.formData with the passed price filters',
      build: () => DiningCubit(),
      act: (cubit) => cubit.setPriceFilters(priceFilters),
      expect: () => [DiningState.formData(selectedPriceFilters: priceFilters)],
    );
  });

  group('setProperties', () {
    final tProperties = [const Property(id: 'id', name: 'name')];

    blocTest(
      'should emit DiningState.formData with the passed properties',
      build: () => DiningCubit(),
      act: (cubit) => cubit.setProperties(tProperties.toSet()),
      expect: () =>
          [DiningState.formData(selectedProperties: tProperties.toSet())],
    );
  });

  group('setOptionsFilters', () {
    final optionsFilters = {
      const Filter(key: 'key', name: 'name', filterType: FilterType.openNow),
      const Filter(
        key: 'key',
        name: 'name',
        filterType: FilterType.bookableOnline,
      ),
      const Filter(
        key: 'key',
        name: 'name',
        filterType: FilterType.mobileOrderable,
      ),
    };

    blocTest(
      'should emit DiningState.formData with the passed option filters',
      build: () => DiningCubit(),
      act: (cubit) => cubit.setOptionsFilters(optionsFilters),
      expect: () =>
          [DiningState.formData(selectedOptionFilters: optionsFilters)],
    );
  });

  group('createLink', () {
    const tProperties = [
      Property(id: 'id1', name: 'name'),
      Property(id: 'id2', name: 'name'),
    ];
    const tCuisines = [
      Filter(key: 'Cuisine', name: 'name', filterType: FilterType.tag),
    ];
    const tMeals = [
      Filter(key: 'Meal', name: 'name', filterType: FilterType.tag),
    ];
    const tPrices = [
      Filter(key: 'Price', name: 'name', filterType: FilterType.tag),
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
      build: () => DiningCubit(),
      setUp: setUpSuccessfulRepositoryCall,
      seed: () => DiningState.formData(
        selectedProperties: tProperties.toSet(),
        selectedCuisineFilters: tCuisines.toSet(),
        selectedMealTypeFilters: tMeals.toSet(),
        selectedPriceFilters: tPrices.toSet(),
      ),
      act: (cubit) => cubit.createLink(
        tAnalyticsKeys.toMap(),
        tAdobeDeepLinkParameter,
      ),
      verify: (_) {
        final deepLinkPath = Uri(
          path: '/discover/dining',
          queryParameters: {
            'filter': 'Cuisine,Meal,Price',
            'propertyId': 'id1,id2',
          },
        ).toString();

        verify(
          () => mockLinksRepository.createLink(
            deepLinkPath: deepLinkPath,
            feature: 'SOP',
            metadata: const OGMetadata(
              title: 'Dining',
            ),
            adobeParameter: tAdobeDeepLinkParameter,
            analyticsKeys: tAnalyticsKeys.toMap(),
          ),
        ).called(1);
      },
    );

    blocTest(
      'should emit in order [DiningState.formData(deepLinkURL: null, isLoading: true, errorMessage: null), '
      'DiningState.formData(deepLinkURL: String, isLoading: false, linkDetails: LinkDetails)] when the call to repository is successful',
      build: () => DiningCubit(),
      seed: () => const DiningState.formData(
        deepLinkURL: 'deeplink',
        isLoading: false,
        errorMessage: 'Something went wrong',
      ),
      setUp: setUpSuccessfulRepositoryCall,
      act: (cubit) => cubit.createLink(
        tAnalyticsKeys.toMap(),
        tAdobeDeepLinkParameter,
      ),
      expect: () => [
        const DiningState.formData(
          deepLinkURL: null,
          isLoading: true,
          errorMessage: null,
        ),
        const DiningState.formData(
          deepLinkURL: tDeepLinkURL,
          isLoading: false,
          metadata: OGMetadata(
            title: Constants.dining,
          ),
        ),
      ],
    );

    blocTest(
      'should emit in order [DiningState.formData(deepLinkURL: null, isLoading: true, hasError: false), '
      'DiningState.formData(isLoading: false, hasError: true)] when the call to repository is unsuccessful',
      build: () => DiningCubit(),
      seed: () => const DiningState.formData(
        deepLinkURL: 'deeplink',
        isLoading: false,
        errorMessage: 'Something went wrong',
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
        const DiningState.formData(
          deepLinkURL: null,
          isLoading: true,
          errorMessage: null,
        ),
        const DiningState.formData(
          isLoading: false,
          errorMessage: 'Error message',
        ),
      ],
    );
  });
}
