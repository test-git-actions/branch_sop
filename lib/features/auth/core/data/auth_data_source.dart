import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class AuthDataSource {
  final FirebaseAuth _firebaseAuth;
  AuthDataSource({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance {
    _firebaseAuth.authStateChanges().listen(_userStream.add);
  }

  final _userStream = BehaviorSubject<User?>();
  Stream<User> get user => _userStream.whereType<User>();
  BehaviorSubject<User?> get authState => _userStream;

  Future<Either<String, Unit>> signIn(String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: 'digarcia@mgmresorts.com',
        password: password,
      );
      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }
}
