import 'package:firebase_core/firebase_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'realtime_database_failure.freezed.dart';

@freezed
sealed class RealtimeDatabaseFailure with _$RealtimeDatabaseFailure {
  const factory RealtimeDatabaseFailure.documentDoesNotExist({
    required String reference,
    required String id,
  }) = RealtimeDatabaseDocumentDoesNotExist;

  const factory RealtimeDatabaseFailure.unauthorized({
    required String reference,
    required String id,
  }) = RealtimeDatabaseUnauthorized;

  const factory RealtimeDatabaseFailure.unknown({
    required String reference,
    required String message,
    required String id,
    required String code,
  }) = RealtimeDatabaseUnknown;

  const factory RealtimeDatabaseFailure.noInternet({
    required String reference,
    required String id,
  }) = RealtimeDatabaseNoInternet;

  const factory RealtimeDatabaseFailure.parseFailure({
    required String reference,
    required String id,
  }) = RealtimeDatabaseParseFailure;

  factory RealtimeDatabaseFailure.fromFirebaseException({
    required FirebaseException exception,
    // Currently required, can be optional in the future if needed
    required String collection,
    required String id,
  }) {
    return switch (exception.code) {
      'unavailable' => RealtimeDatabaseFailure.noInternet(
          reference: collection,
          id: id,
        ),
      'permissionDenied' => RealtimeDatabaseFailure.unauthorized(
          reference: collection,
          id: id,
        ),
      _ => RealtimeDatabaseFailure.unknown(
          reference: collection,
          id: id,
          message: exception.message ?? '',
          code: exception.code,
        ),
    };
  }
}
