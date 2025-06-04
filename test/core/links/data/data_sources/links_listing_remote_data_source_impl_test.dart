import 'package:branch_links/core/clients/realtime_database_client/database_path.dart';
import 'package:branch_links/core/clients/realtime_database_client/realtime_database_client.dart';
import 'package:branch_links/core/clients/realtime_database_client/realtime_database_failure.dart';
import 'package:branch_links/core/links/data/sources/links_listing_remote_data_source.dart';
import 'package:branch_links/core/links/data/sources/links_listing_remote_data_source_impl.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database_mocks/firebase_database_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MockFirebaseDatabase fakeFirebaseDatabase;
  late DatabaseReference databaseReference;
  late LinksListingRemoteDataSource dataSource;

  const tDatabasePath = DatabasePath.clubs;

  setUp(() {
    fakeFirebaseDatabase = MockFirebaseDatabase();
    databaseReference =
        fakeFirebaseDatabase.ref().child('uat/links/${tDatabasePath.path}');

    dataSource = LinksListingRemoteDataSourceImpl(
      RealtimeDatabaseClient(fakeFirebaseDatabase),
    );
  });
  // By default firebase_database_mocks keeps the data in memory as long as
  // the tests are running, but you can disable the data persistence
  // as follow: MockFirebaseDatabase.setDataPersistenceEnabled(enabled: false);
  tearDown(
    () => MockFirebaseDatabase.setDataPersistenceEnabled(enabled: false),
  );

  group('getLinks', () {
    const tLink = Link(id: 'id', name: 'name', link: 'link');

    test(
        'should return the tLink in the collection when the call is successful',
        () async {
      // arrange
      databaseReference.child('1').set({'name': 'name', 'link': 'link'});

      // act
      final linksEither =
          await dataSource.getLinks(databasePath: tDatabasePath);

      // assert
      expect(linksEither.isRight(), isTrue);
      linksEither.map(
        (r) {
          expect(r, [
            isA<Link>().having(
              (link) => link.name,
              'name',
              tLink.name,
            ),
          ]);
        },
      );
    });

    test('should return an error when there are no documents', () async {
      final linksEither =
          await dataSource.getLinks(databasePath: tDatabasePath);
      expect(linksEither.isRight(), isFalse);
      linksEither.leftMap((failure) {
        expect(
          failure,
          RealtimeDatabaseFailure.documentDoesNotExist(
            reference: "/uat/links/${tDatabasePath.path}/",
            id: tDatabasePath.path,
          ),
        );
      });
    });
  });
}
