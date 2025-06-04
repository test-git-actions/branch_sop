import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/core/clients/api_client/api_failure.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/features/analytics_keys/data/models/analytics_keys.dart';
import 'package:branch_links/features/discover/screens/create_page_deep_link/cubit/create_page_deep_link_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockLinksRepository extends Mock implements LinksRepository {}

void main() {
  late MockLinksRepository mockLinksRepository;

  const tLink = Link(
    id: 'id',
    name: 'name',
    link: 'link',
    path: 'path',
  );

  const tAnalyticsKeys = AnalyticsKeys(
    platformOrigin: 'platformOrigin',
    campaign: 'campaign',
    utmMedium: 'utmMedium',
    creativeName: 'creativeName',
    keyword: 'keyword',
    site: 'site',
  );
  const tAdobeDeepLinkParameter = 'test-adobe-deep-link-parameter';

  setUp(
    () {
      mockLinksRepository = MockLinksRepository();
      GetIt.instance.registerLazySingleton<LinksRepository>(
        () => mockLinksRepository,
      );
    },
  );

  tearDown(
    () {
      GetIt.instance.reset();
    },
  );

  group(
    'updated values',
    () {
      blocTest(
        'update link name',
        build: () => CreatePageDeepLinkCubit(
          link: tLink,
        ),
        act: (cubit) => cubit.updateLinkName('newLinkName'),
        expect: () => [
          CreatePageDeepLinkState.formData(
            link: tLink.copyWith(
              name: 'newLinkName',
            ),
          ),
        ],
      );

      blocTest(
        'update link name',
        build: () => CreatePageDeepLinkCubit(
          link: tLink,
        ),
        act: (cubit) => cubit.updateLinkName('newLinkName'),
        expect: () => [
          CreatePageDeepLinkState.formData(
            link: tLink.copyWith(
              name: 'newLinkName',
            ),
          ),
        ],
      );
    },
  );

  group(
    'generate normal Deep Link',
    () {
      const tDeepLinkURL = 'deepLinkURL';

      void setUpSuccessfulRepositoryCall() {
        // Call API to get deep link
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

      void setUpUnSuccessfulRepositoryCall() {
        // Call API to get deep link
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
            ApiFailure.connectionError(
              errorMessage: 'STHG went wrong',
            ),
          ),
        );
      }

      blocTest(
        'should LinksRepository.createLink be invoked without errors',
        setUp: setUpSuccessfulRepositoryCall,
        seed: () => const CreatePageDeepLinkState.formData(
          link: tLink,
          isLoading: false,
        ),
        build: () => CreatePageDeepLinkCubit(
          link: tLink,
        ),
        act: (cubit) => cubit.generateNormalLink(
          tAnalyticsKeys.toMap(),
          tAdobeDeepLinkParameter,
        ),
        expect: () => [
          // Loading state before call
          const CreatePageDeepLinkState.formData(
            link: tLink,
            isLoading: true,
          ),
          // Loaded state after succesful call
          const CreatePageDeepLinkState.formData(
            link: tLink,
            isLoading: false,
            generatedLink: tDeepLinkURL,
          ),
        ],
      );

      blocTest(
        'should LinksRepository.createLink be invoked with ApiFailure error',
        setUp: setUpUnSuccessfulRepositoryCall,
        seed: () => const CreatePageDeepLinkState.formData(
          link: tLink,
          isLoading: false,
        ),
        build: () => CreatePageDeepLinkCubit(
          link: tLink,
        ),
        act: (cubit) => cubit.generateNormalLink(
          tAnalyticsKeys.toMap(),
          tAdobeDeepLinkParameter,
        ),
        expect: () => [
          // Loading state before call
          const CreatePageDeepLinkState.formData(
            link: tLink,
            isLoading: true,
          ),
          // Loaded state after succesful call
          const CreatePageDeepLinkState.formData(
            link: tLink,
            isLoading: false,
            apiErrorMessage: 'STHG went wrong',
          ),
        ],
      );
    },
  );
}
