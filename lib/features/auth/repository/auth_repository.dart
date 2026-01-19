
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/exceptions/network_exception.dart';
import '../../../util/repository_exception.dart';



part 'auth_repository.g.dart';

/// The provider for accessing the [AuthRepository]
@riverpod
AuthRepository authRepo(AuthRepoRef ref) => AuthRepository(ref);

class AuthRepository {
  AuthRepository(this.ref);
  final _auth = FirebaseAuth.instance;

  final AuthRepoRef ref;

  Future<dynamic> signUpWithEmailPassword(String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw RepositoryException(message: e.message);
    } on NetworkException catch (e) {
      throw RepositoryException(message: e.message);
    }
  }

  Future<dynamic> loginWithEmailPassword(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw RepositoryException(message: e.message);
    } on NetworkException catch (e) {
      throw RepositoryException(message: e.message);
    }
  }

  Future<dynamic> forgotPassword(String email) async {
    try {
      _auth.setLanguageCode("fr");
      await _auth.sendPasswordResetEmail(
        email: email,
      );
      return "reset";
    } on FirebaseAuthException catch (e) {
      throw RepositoryException(message: e.message);
    } on NetworkException catch (e) {
      throw RepositoryException(message: e.message);
    }
  }

}
