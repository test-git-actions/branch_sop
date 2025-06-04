import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/core/clients/api_client/api_failure.dart';
import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/data/product/repository/product_repository.dart';
import 'package:branch_links/core/data/product/models/product.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/features/analytics_keys/data/models/analytics_keys.dart';
import 'package:branch_links/features/discover/screens/create_deep_link/cubit/create_deep_link_cubit.dart';
import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:branch_links/features/properties/data/repositories/property_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRepository extends Mock implements ProductRepository {}

class MockPropertyRepository extends Mock implements PropertyRepository {}

class MockLinksRepository extends Mock implements LinksRepository {}

void main() {
  late MockProductRepository mockProductRepository;
  late MockPropertyRepository mockPropertyRepository;
  late MockLinksRepository mockDeepLinkRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    GetIt.instance.registerLazySingleton<ProductRepository>(
      () => mockProductRepository,
    );

    mockPropertyRepository = MockPropertyRepository();
    GetIt.instance.registerLazySingleton<PropertyRepository>(
      () => mockPropertyRepository,
    );

    mockDeepLinkRepository = MockLinksRepository();
    GetIt.instance.registerLazySingleton<LinksRepository>(
      () => mockDeepLinkRepository,
    );
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  group('generateContentLink for PDPs', () {
    const tProperty = Property(
      id: '28',
      name: 'propertyName',
      path: 'propertyPath',
      marketId: 'propertyMarketId',
      shortName: 'propertyShortName',
      propertyKey: 'propertyKey',
    );

    const tPdpItem = Product(
      id: '28',
      name: 'pdpName',
      path: 'pdpPath',
      descriptions: {
        'overview': 'overview',
      },
      images: {
        'overview': {
          'url': 'overviewImageLink',
        },
        'title': {
          'url': 'titleImageLink',
        },
      },
      propertyId: 'propertyId',
    );

    const tDeepLinkURL = 'deepLinkURL';

    const pdpType = ProductType.show;
    const detailLink = 'detailLink';

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
      // Call to get show.propertyId
      when(() => mockProductRepository.getProductById('28', ProductType.show))
          .thenAnswer(
        (_) async => const Right(tPdpItem),
      );

      // Call to get property by id
      when(() => mockPropertyRepository.getPropertyById('propertyId'))
          .thenAnswer(
        (_) async => const Right(tProperty),
      );

      // Call API to get deep link
      when(
        () => mockDeepLinkRepository.createLink(
          deepLinkPath: any(named: 'deepLinkPath'),
          feature: any(named: 'feature'),
          metadata: any(named: 'metadata'),
          adobeParameter: any(named: 'adobeParameter'),
          analyticsKeys: any(named: 'analyticsKeys'),
        ),
      ).thenAnswer((_) async => const Right(tDeepLinkURL));
    }

    void setUpUnSuccessfulRepositoryCall() {
      // Call to get show.propertyId
      when(() => mockProductRepository.getProductById('28', ProductType.show))
          .thenAnswer(
        (_) async => const Right(tPdpItem),
      );

      // Call to get property by id
      when(() => mockPropertyRepository.getPropertyById('propertyId'))
          .thenAnswer(
        (_) async => const Right(tProperty),
      );

      // Call API to get deep link
      when(
        () => mockDeepLinkRepository.createLink(
          deepLinkPath: any(named: 'deepLinkPath'),
          feature: any(named: 'feature'),
          metadata: any(named: 'metadata'),
          adobeParameter: any(named: 'adobeParameter'),
          analyticsKeys: any(named: 'analyticsKeys'),
        ),
      ).thenAnswer(
        (_) async => const Left(
          ApiFailure.connectionError(
            errorMessage: 'STHG went wrong',
          ),
        ),
      );
    }

    blocTest(
      'should LinksRepository.createLink for PDPs be invoked without errors',
      build: () => CreatePdpLinkCubit(
        productType: ProductType.show,
        link: const Link(
          id: 'detailLinkId',
          name: 'detailLinkName',
          link: 'detailLinkLink',
        ),
      ),
      setUp: setUpSuccessfulRepositoryCall,
      seed: () => CreateDeepLinkState.formData(
        productType: pdpType,
        link: Link(
          id: tPdpItem.id,
          name: tPdpItem.name,
          link: detailLink,
        ),
        isLoading: false,
      ),
      act: (cubit) => cubit.generateDeepLink(
        tAnalyticsKeys.toMap(),
        tAdobeDeepLinkParameter,
      ),
      expect: () => [
        // Loading state before call
        CreateDeepLinkState.formData(
          productType: pdpType,
          link: Link(
            id: tPdpItem.id,
            name: tPdpItem.name,
            link: detailLink,
          ),
          isLoading: true,
        ),
        // Loaded state after succesful call
        CreateDeepLinkState.formData(
          productType: pdpType,
          link: Link(
            id: tPdpItem.id,
            name: tPdpItem.name,
            link: detailLink,
          ),
          isLoading: false,
          generatedLink: tDeepLinkURL,
        ),
      ],
      verify: (_) {
        final deepLinkPath = Uri(
          path: 'entertainment/show',
          queryParameters: {
            'path': tPdpItem.path,
          },
        ).toString();

        return mockDeepLinkRepository.createLink(
          deepLinkPath: deepLinkPath,
          feature: 'SOP',
        );
      },
    );

    blocTest(
      'should LinksRepository.createLink  for PDPs be invoked with ApiFailure error',
      build: () => CreatePdpLinkCubit(
        productType: ProductType.show,
        link: const Link(
          id: 'detailLinkId',
          name: 'detailLinkName',
          link: 'detailLinkLink',
        ),
      ),
      setUp: setUpUnSuccessfulRepositoryCall,
      seed: () => CreateDeepLinkState.formData(
        productType: pdpType,
        link: Link(
          id: tPdpItem.id,
          name: tPdpItem.name,
          link: detailLink,
        ),
        isLoading: false,
        apiErrorMessage: null,
      ),
      act: (cubit) => cubit.generateDeepLink(
        tAnalyticsKeys.toMap(),
        tAdobeDeepLinkParameter,
      ),
      expect: () => [
        // Loading state before call
        CreateDeepLinkState.formData(
          productType: pdpType,
          link: Link(
            id: tPdpItem.id,
            name: tPdpItem.name,
            link: detailLink,
          ),
          isLoading: true,
        ),
        // Loaded state after unsuccesful call with ApiFailure error message
        CreateDeepLinkState.formData(
          productType: pdpType,
          link: Link(
            id: tPdpItem.id,
            name: tPdpItem.name,
            link: detailLink,
          ),
          isLoading: false,
          apiErrorMessage: 'STHG went wrong',
        ),
      ],
    );
  });
}
