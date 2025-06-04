import 'package:firebase_core/firebase_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestore_failure.freezed.dart';

@freezed
sealed class FirestoreFailure with _$FirestoreFailure {
  const FirestoreFailure._();

  const factory FirestoreFailure.documentDoesNotExist({
    required String collection,
    required String id,
  }) = FirestoreDocumentDoesNotExist;

  const factory FirestoreFailure.noInternet({
    required String collection,
    required String id,
  }) = FirestoreNoInternet;

  const factory FirestoreFailure.unauthorized({
    required String collection,
    required String id,
  }) = FirestoreFailureUnauthorized;

  const factory FirestoreFailure.bundleNotStored({
    required String collection,
  }) = FirestoreBundleNotStored;

  const factory FirestoreFailure.unknown({
    required String collection,
    required String id,
    required String? message,
    required String? code,
  }) = FirestoreFailureUnknown;

  const factory FirestoreFailure.parseFailure({
    required String collection,
    required String id,
  }) = FirestoreParseFailure;

  // https://firebase.google.com/docs/reference/swift/firebasefirestore/api/reference/Enums/Error-Types
  factory FirestoreFailure.fromFirebaseException({
    required FirebaseException exception,
    // Currently required, can be optional in the future if needed
    required String collection,
    required String id,
  }) {
    return switch (exception.code) {
      'unavailable' => FirestoreFailure.noInternet(
          collection: collection,
          id: id,
        ),
      'permissionDenied' => FirestoreFailure.unauthorized(
          collection: collection,
          id: id,
        ),
      'non-existent-named-query' => FirestoreFailure.bundleNotStored(
          collection: collection,
        ),
      _ => FirestoreFailure.unknown(
          collection: collection,
          id: id,
          message: exception.message,
          code: exception.code,
        ),
    };
  }
}
