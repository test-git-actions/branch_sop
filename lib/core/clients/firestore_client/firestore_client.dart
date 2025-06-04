import 'dart:async';

import 'package:branch_links/env.dart';
import 'package:branch_links/core/clients/firestore_client/collections.dart';
import 'package:branch_links/core/clients/firestore_client/firestore_failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirestoreClient {
  final FirebaseFirestore _firestore;

  static const _archivedKey = 'archived';

  FirestoreClient(this._firestore);

  /// Creates a collection reference.
  ///
  /// The collection is created based on the environment, if the environment
  /// is production, the collection is created in the firestore root,
  /// otherwise, the collection is created in a subcollection of the
  /// 'environments' root collection.
  CollectionReference<Map<String, dynamic>> collectionRef<T>(
    String collection,
  ) {
    // Any prod environment uses the root collection
    if (Env().isProdApp) {
      return _firestore.collection(collection);
    } else {
      // Any other environment uses a subcollection of the environments collection
      return _firestore
          .collection(Collections.environments)
          .doc(Env().environment.name)
          .collection(collection);
    }
  }

  /// Creates a collection reference with a parser to convert the data to a
  /// model.
  ///
  /// The collection is created based on the environment, if the environment
  /// is production, the collection is created in the firestore root,
  /// otherwise, the collection is created in a subcollection of the
  /// 'environments' root collection.
  /// [injectId] injects the document id into the model.
  CollectionReference<Either<FirestoreFailure, T>> parsedCollectionRef<T>(
    String collection,
    T Function(Map<String, dynamic>) parser, {
    bool injectId = false,
  }) {
    return collectionRef(
      collection,
    ).withConverter(
      // fromFirestore is only called when snapshot.exists is true
      fromFirestore: (snapshot, _) {
        try {
          final object = parser(
            injectId
                ? {...snapshot.data()!, 'id': snapshot.id}
                : snapshot.data()!,
          );
          return right(object);
        } catch (ex, _) {
          final failure = FirestoreParseFailure(
            collection: collection,
            id: snapshot.id,
          );

          return left(failure);
        }
      },

      // We should never write into firestore from the app
      toFirestore: (_, __) => throw UnimplementedError(),
    );
  }

  /// Gets all documents from a [collectionRef].
  ///
  /// If [filterArchivedDocuments] is true, archived documents will be filtered
  /// out.
  Future<Either<FirestoreFailure, List<T>>> getAllDocuments<T>({
    required CollectionReference<Either<FirestoreFailure, T>> collectionRef,
    bool filterArchivedDocuments = false,
  }) async {
    try {
      final QuerySnapshot<Either<FirestoreFailure, T>> snapshots;
      if (filterArchivedDocuments) {
        snapshots =
            await collectionRef.where(_archivedKey, isEqualTo: false).get();
      } else {
        snapshots = await collectionRef.get();
      }

      return right(
        snapshots.docs
            .map((document) => document.data().fold((l) => null, id))
            .whereType<T>()
            .toList(),
      );
    } on FirebaseException catch (ex) {
      return left(
        FirestoreFailure.fromFirebaseException(
          exception: ex,
          collection: collectionRef.id,
          id: 'all',
        ),
      );
    }
  }

  Stream<List<T>> listenAllDocuments<T>({
    required CollectionReference<Either<FirestoreFailure, T>> collectionRef,
  }) {
    final snapshots = collectionRef.snapshots();

    return snapshots.map(
      (snapshot) => snapshot.docs
          .map(
            (document) => document.data().fold(
              (failure) {
                return null;
              },
              id,
            ),
          )
          .whereType<T>()
          .toList(),
    );
  }

  Stream<Either<FirestoreFailure, T>> listenDocumentById<T>({
    required CollectionReference<Either<FirestoreFailure, T>> collectionRef,
    required String id,
  }) {
    final snapshotsStream = collectionRef.doc(id).snapshots();
    return snapshotsStream.map((snapshot) {
      if (!snapshot.exists) {
        final failure = FirestoreDocumentDoesNotExist(
          collection: collectionRef.id,
          id: snapshot.id,
        );

        return left(failure);
      }
      return snapshot.data()!;
    });
  }

  Future<Either<FirestoreFailure, T>> getDocumentById<T>({
    required CollectionReference<Either<FirestoreFailure, T>> collectionRef,
    required String id,
  }) async {
    try {
      final snapshot = await collectionRef.doc(id).get();
      if (!snapshot.exists) {
        final failure = FirestoreDocumentDoesNotExist(
          collection: collectionRef.id,
          id: snapshot.id,
        );

        return left(failure);
      }

      return snapshot.data()!;
    } on FirebaseException catch (e) {
      final failure = FirestoreFailure.fromFirebaseException(
        exception: e,
        collection: collectionRef.id,
        id: id,
      );
      return left(failure);
    }
  }

  Future<Either<FirestoreFailure, bool>> updateDocument<T>({
    required CollectionReference<Map<String, dynamic>> collectionRef,
    required String id,
    required Map<String, Object?> map,
  }) async {
    try {
      await collectionRef.doc(id).set(map, SetOptions(merge: true));
      return right(true);
    } on FirebaseException catch (e) {
      final failure = FirestoreFailure.fromFirebaseException(
        exception: e,
        collection: collectionRef.id,
        id: id,
      );
      return left(failure);
    } catch (ex) {
      return left(
        FirestoreFailureUnknown(
          id: id,
          collection: collectionRef.path,
          message: 'Error updating document: $ex',
          code: null,
        ),
      );
    }
  }
}
