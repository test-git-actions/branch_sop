import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/core/clients/api_client/api_failure.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/features/analytics_keys/data/models/analytics_keys.dart';
import 'package:branch_links/features/checkin/cubit/create_checkin_link_cubit.dart';
import 'package:branch_links/features/checkin/models/create_checkin_link.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockLinksRepository extends Mock implements LinksRepository {}

void main() {
  late CreateCheckinLinkCubit createCheckinLinkCubit;
  late MockLinksRepository mockLinksRepository;

  setUp(() {
    mockLinksRepository = MockLinksRepository();
    GetIt.instance.registerLazySingleton<LinksRepository>(
      () => mockLinksRepository,
    );
    createCheckinLinkCubit = CreateCheckinLinkCubit();
  });

  tearDown(() => GetIt.instance.reset());

  group('updateLastName', () {
    blocTest(
      'should update the last name of the deep link',
      build: () => createCheckinLinkCubit,
      act: (cubit) {
        cubit.updateLastName('Doe');
      },
      expect: () => [
        const CreateCheckinLinkState(
          deepLink: CheckinLink(
            lastName: 'Doe',
            reservationConfirmationNumber: null,
            adobeDeepLinkParameter: null,
          ),
          isLoading: false,
          apiErrorMessage: null,
          generatedDeepLink: null,
        ),
      ],
    );
  });

  group('updateReservationNumber', () {
    blocTest(
      'should update the reservation number of the deep link',
      build: () => createCheckinLinkCubit,
      act: (cubit) {
        cubit.updateReservationNumber('28');
      },
      expect: () => [
        const CreateCheckinLinkState(
          deepLink: CheckinLink(
            lastName: null,
            reservationConfirmationNumber: '28',
            adobeDeepLinkParameter: null,
          ),
          isLoading: false,
          apiErrorMessage: null,
          generatedDeepLink: null,
        ),
      ],
    );
  });

  group('generateDeepLink', () {
    const deepLinkUrl = 'https://example.com/test-deep-link';
    const errorMessage = 'An error occurred';
    const tAnalyticsKeys = AnalyticsKeys(
      platformOrigin: 'platformOrigin',
      campaign: 'campaign',
      utmMedium: 'utmMedium',
      creativeName: 'creativeName',
      keyword: 'keyword',
      site: 'site',
    );
    const tAdobeDeepLinkParameter = 'test-adobe-deep-link-parameter';

    blocTest<CreateCheckinLinkCubit, CreateCheckinLinkState>(
      'emits isLoading true and then generates deep link',
      build: () => createCheckinLinkCubit,
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
          (_) async => const Right(deepLinkUrl),
        );
      },
      act: (cubit) => cubit.generateDeepLink(
        tAnalyticsKeys.toMap(),
        tAdobeDeepLinkParameter,
      ),
      expect: () => [
        const CreateCheckinLinkState(isLoading: true),
        const CreateCheckinLinkState(
          generatedDeepLink: deepLinkUrl,
          isLoading: false,
        ),
      ],
      verify: (_) {
        // Check if the repository was called with the correct parameters
        verify(
          () => mockLinksRepository.createLink(
            deepLinkPath: any(named: 'deepLinkPath'),
            feature: any(named: 'feature'),
            metadata: any(named: 'metadata'),
            adobeParameter: any(named: 'adobeParameter'),
            analyticsKeys: any(named: 'analyticsKeys'),
          ),
        ).called(1);
        verifyNoMoreInteractions(
          mockLinksRepository,
        );
      },
    );

    blocTest<CreateCheckinLinkCubit, CreateCheckinLinkState>(
      'should emit an error message when the repository call fails',
      build: () => createCheckinLinkCubit,
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
            ApiFailure.unknownError(
              errorMessage: errorMessage,
            ),
          ),
        );
      },
      act: (cubit) => cubit.generateDeepLink(
        tAnalyticsKeys.toMap(),
        tAdobeDeepLinkParameter,
      ),
      expect: () => [
        const CreateCheckinLinkState(isLoading: true),
        const CreateCheckinLinkState(
          isLoading: false,
          apiErrorMessage: errorMessage,
        ),
      ],
      // Check if the repository was called with the correct parameters
      verify: (_) {
        verify(
          () => mockLinksRepository.createLink(
            deepLinkPath: any(named: 'deepLinkPath'),
            feature: any(named: 'feature'),
            metadata: any(named: 'metadata'),
            adobeParameter: any(named: 'adobeParameter'),
            analyticsKeys: any(named: 'analyticsKeys'),
          ),
        ).called(1);
        verifyNoMoreInteractions(
          mockLinksRepository,
        );
      },
    );
  });
}
