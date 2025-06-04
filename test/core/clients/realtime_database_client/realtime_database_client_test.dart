import 'package:branch_links/core/clients/realtime_database_client/realtime_database_client.dart';
import 'package:branch_links/core/clients/realtime_database_client/realtime_database_failure.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database_mocks/firebase_database_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late RealtimeDatabaseClient realtimeDatabaseClient;
  late MockFirebaseDatabase mockFirebaseDatabase;
  late DatabaseReference databaseReference;

  setUp(() {
    mockFirebaseDatabase = MockFirebaseDatabase();
    realtimeDatabaseClient = RealtimeDatabaseClient(mockFirebaseDatabase);
    databaseReference = mockFirebaseDatabase.ref();
  });

  group('getAllDocuments', () {
    test('should return a list of objects when data is available', () async {
      // Arrange - Add test data to the mock Firebase Database
      final testData = {
        '1': {'name': 'Item 1', 'link': 'link1'},
        '2': {'name': 'Item 2', 'link': 'link2'},
      };
      final testReference = databaseReference.child('testPath');
      await testReference.set(testData);

      // Act - Get data using the client
      final result = await realtimeDatabaseClient.getAllChildrens(
        reference: testReference,
        parser: Link.fromJson,
      );

      // Assert - Check the result
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success, but got failure: $failure'),
        (data) {
          expect(data.length, testData.length);
        },
      );
    });

    test('should return a failure when reference does not exist', () async {
      // Arrange - Use a reference that does not exist
      final nonExistentReference = databaseReference.child('nonExistentPath');

      // Act - Get data using the client
      final result = await realtimeDatabaseClient.getAllChildrens(
        reference: nonExistentReference,
        parser: Link.fromJson,
      );

      // Assert - Check the result
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<RealtimeDatabaseFailure>());
        },
        (data) => fail('Expected failure, but got data: $data'),
      );
    });
  });
}
