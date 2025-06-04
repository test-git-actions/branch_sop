import 'package:branch_links/env.dart';
import 'package:branch_links/core/clients/realtime_database_client/realtime_database_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@lazySingleton
class RealtimeDatabaseClient {
  final FirebaseDatabase _firebaseDatabase;

  RealtimeDatabaseClient(this._firebaseDatabase);

  /// Creates a reference to the realtime database.
  /// The reference is created based on the environment, if the environment
  /// is production, the reference is created in prod/links/clubs node,
  /// otherwise, the reference is created in uat/links/clubs node.
  DatabaseReference getReference(
    String path,
  ) {
    if (Env().isProdApp) {
      return _firebaseDatabase.ref().child('links').child(path);
    } else {
      return _firebaseDatabase
          .ref()
          .child(Env().environment.name)
          .child('links')
          .child(path);
    }
  }

  /// Creates a reference with a parser function to convert the data to a model.
  Future<Either<RealtimeDatabaseFailure, List<T>>> getAllChildrens<T>({
    required DatabaseReference reference,
    required T Function(Map<String, dynamic>) parser,
  }) async {
    try {
      final DataSnapshot snapshot = await reference.get();

      final value = snapshot.value;
      final entries = _getEntries(value);

      if (entries != null) {
        final List<T> objects = entries
            .map((entry) {
              return parser(
                {
                  'id': entry.key.toString(),
                  ...entry.value,
                },
              );
            })
            .whereType<T>()
            .toList();

        return right(objects);
      } else {
        final realtimeDatabaseFailure =
            RealtimeDatabaseFailure.documentDoesNotExist(
          reference: reference.path,
          id: snapshot.key.toString(),
        );
        Logger.root.severe(
          'RTDB Client error',
          RealtimeDatabaseFailure.documentDoesNotExist(
            reference: reference.path,
            id: snapshot.key.toString(),
          ),
        );
        return left(
          realtimeDatabaseFailure,
        );
      }
    } catch (ex, _) {
      Logger.root.severe(
        'RTDB Client error',
        RealtimeDatabaseFailure.documentDoesNotExist(
          reference: reference.path,
          id: 'id',
        ),
      );
      return left(
        RealtimeDatabaseFailure.unknown(
          reference: reference.toString(),
          message: 'Error getting DataSnapshot',
          id: reference.key.toString(),
          code: '',
        ),
      );
    }
  }

  Iterable<MapEntry>? _getEntries(Object? value) {
    if (value is Map) return value.entries;
    if (value is List) return value.asMap().entries;
    return null;
  }
}
