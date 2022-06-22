import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User? get getCurrentUser;

  Stream<User?> authStateChanges();

  Future<User?> loginWithEmailAndPassword(
      {required String email, required String password});

  Future<User?> signUpWithEmailAndPassword(
      {required String email, required String password});

  Future<void> logOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User? get getCurrentUser => _firebaseAuth.currentUser;

  @override
  Future<User?> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user;
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user;
  }

  @override
  Future<void> logOut() async => await _firebaseAuth.signOut();
}
