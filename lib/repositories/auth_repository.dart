import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  AuthRepository(this.firebaseAuth);
  final FirebaseAuth firebaseAuth;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
