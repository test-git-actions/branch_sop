import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/core/clients/api_client/api_failure.dart';
import 'package:branch_links/core/links/data/models/link_details.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/features/link_details/screens/cubit/link_details_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockLinksRepository extends Mock implements LinksRepository {}

void main() {
  late MockLinksRepository mockLinksRepository;

  setUp(() {
    mockLinksRepository = MockLinksRepository();
    GetIt.instance
        .registerLazySingleton<LinksRepository>(() => mockLinksRepository);
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  group(
    'getGeneratedLinkDetails',
    () {
      const tLink = 'link';
      final tLinkDetails = LinkDetails(
        id: 'id',
        feature: 'feature',
        deepLinkPath: Uri(),
        metadata: const OGMetadata(),
      );

      void setUpSuccessfulRepositoryCall() {
        when(() => mockLinksRepository.getGeneratedLinkDetails(any()))
            .thenAnswer((_) async => Right(tLinkDetails));
      }

      blocTest(
        'should call LinksRepository.getGeneratedLinkDetails with the correct parameters',
        build: () => LinkDetailsCubit(),
        setUp: setUpSuccessfulRepositoryCall,
        act: (cubit) => cubit.getGeneratedLinkDetails(tLink),
        verify: (_) =>
            verify(() => mockLinksRepository.getGeneratedLinkDetails(tLink)),
      );

      blocTest(
        'should emit [LinkDetailsState.loading and LinkDetailsState.loaded] when the call to the repository is successful',
        build: () => LinkDetailsCubit(),
        setUp: setUpSuccessfulRepositoryCall,
        act: (cubit) => cubit.getGeneratedLinkDetails(tLink),
        expect: () => [
          const LinkDetailsState.loading(),
          LinkDetailsState.loaded(tLink, tLinkDetails),
        ],
      );

      blocTest(
        'should emit [LinkDetailsState.loading and LinkDetailsState.error] when the call to the repository is unsuccessful',
        build: () => LinkDetailsCubit(),
        setUp: () {
          when(() => mockLinksRepository.getGeneratedLinkDetails(any()))
              .thenAnswer(
            (_) async => const Left(ApiFailure.connectionError()),
          );
        },
        act: (cubit) => cubit.getGeneratedLinkDetails(tLink),
        expect: () => [
          const LinkDetailsState.loading(),
          const LinkDetailsState.error(),
        ],
      );
    },
  );
}
