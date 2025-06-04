import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/core/clients/realtime_database_client/database_path.dart';
import 'package:branch_links/core/clients/realtime_database_client/realtime_database_failure.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/core/links/screens/static_links_cubit/static_links_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockDetailLinksRepository extends Mock implements LinksRepository {}

void main() {
  late MockDetailLinksRepository mockDetailLinksRepository;

  setUp(() {
    mockDetailLinksRepository = MockDetailLinksRepository();
    GetIt.instance.registerLazySingleton<LinksRepository>(
      () => mockDetailLinksRepository,
    );
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  final tLinks = [
    const Link(
      id: '1',
      name: 'Club 1',
      link: 'https://mgm.com/club1',
    ),
    const Link(
      id: '2',
      name: 'Bar 2',
      link: 'https://mgm.com/bar2',
    ),
    const Link(
      id: '3',
      name: 'La Pasiva',
      link: 'https://mgm.com/lapasiva',
    ),
  ];

  group(
    'getLinks',
    () {
      const tDatabasePath = DatabasePath.clubs;

      setUpAll(() {
        registerFallbackValue(tDatabasePath);
      });

      void setupRightRepositoryCall() {
        when(
          () => mockDetailLinksRepository.getLinks(
            databasePath: any(named: 'databasePath'),
          ),
        ).thenAnswer((_) async => Right(tLinks));
      }

      blocTest(
        'should emit loading and dataLoaded states when successful',
        build: () => StaticLinksCubit(databasePath: tDatabasePath),
        setUp: setupRightRepositoryCall,
        act: (cubit) => cubit.getLinks(),
        verify: (bloc) {
          verify(
            () => mockDetailLinksRepository.getLinks(
              databasePath: tDatabasePath,
            ),
          ).called(1);
        },
      );

      blocTest(
        'should emit loading and error states when unsuccessful',
        build: () => StaticLinksCubit(databasePath: tDatabasePath),
        setUp: () {
          when(
            () => mockDetailLinksRepository.getLinks(
              databasePath: tDatabasePath,
            ),
          ).thenAnswer(
            (_) async => Left(
              RealtimeDatabaseFailure.documentDoesNotExist(
                reference: 'uat/links/${DatabasePath.clubs.path}',
                id: 'id',
              ),
            ),
          );
        },
        act: (cubit) => cubit.getLinks(),
        expect: () => [
          const StaticLinksState.error(),
        ],
      );
    },
  );
}
