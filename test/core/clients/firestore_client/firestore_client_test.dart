import 'package:branch_links/core/clients/firestore_client/collections.dart';
import 'package:branch_links/core/clients/firestore_client/firestore_client.dart';
import 'package:branch_links/env.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FakeFirebaseFirestore fakeFirestore;
  late FirestoreClient firestoreClient;

  setUp(() {
    fakeFirestore = FakeFirebaseFirestore();
    firestoreClient = FirestoreClient(fakeFirestore);
  });

  group('collectionRef on dev flavor', () {
    test(
      'should return uat collection reference based on selected custom environment',
      () {
        Env().environment = Environment.uat;

        final dataCollectionReference = firestoreClient.collectionRef(
          Collections.data,
        );

        final devDataCollectionReference = fakeFirestore
            .collection(Collections.environments)
            .doc(Environment.uat.name)
            .collection(Collections.data);

        expect(
          dataCollectionReference.path,
          devDataCollectionReference.path,
        );
      },
    );

    test(
      'should return preprod collection reference based on selected custom environment',
      () {
        const selectedEnv = Environment.preProd;
        Env().environment = selectedEnv;

        final dataCollectionReference = firestoreClient.collectionRef(
          Collections.data,
        );

        final devDataCollectionReference = fakeFirestore
            .collection(Collections.environments)
            .doc(selectedEnv.name)
            .collection(Collections.data);

        expect(
          dataCollectionReference.path,
          devDataCollectionReference.path,
        );
      },
    );
  });

  group('collectionRef on prod flavor', () {
    setUp(() {
      Env.test(Flavor.prod);
    });

    test(
      'should return prod collection',
      () {
        final dataCollectionReference = firestoreClient.collectionRef(
          Collections.data,
        );

        final prodDataCollectionReference =
            fakeFirestore.collection(Collections.data);

        expect(
          dataCollectionReference.path,
          prodDataCollectionReference.path,
        );
      },
    );

    test(
      'should return prod collection although we set environment to qa4',
      () {
        Env().environment = Environment.qa4;

        final dataCollectionReference = firestoreClient.collectionRef(
          Collections.data,
        );

        final prodDataCollectionReference =
            fakeFirestore.collection(Collections.data);

        expect(
          dataCollectionReference.path,
          prodDataCollectionReference.path,
        );
      },
    );
  });
}
