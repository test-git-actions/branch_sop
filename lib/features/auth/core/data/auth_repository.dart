import 'package:branch_links/env.dart';
import 'package:branch_links/features/auth/core/data/auth_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class AuthRepository {
  final AuthDataSource _authDataSource;
  AuthRepository(this._authDataSource);

  late final Stream<User> currentUser = _authDataSource.user;

  Future<Either<String, Unit>> signIn(String password) {
    return _authDataSource.signIn(password);
  }
}

class UserRefreshStream extends ChangeNotifier {
  final disposableBag = CompositeSubscription();

  UserRefreshStream() {
    notifyListeners();
    final stream =
        Env.sl<AuthRepository>().currentUser.listen((_) => notifyListeners());
    disposableBag.add(stream);
  }

  @override
  void dispose() async {
    await disposableBag.dispose();
    super.dispose();
  }
}
