import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream of auth changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Current User
  User? get currentUser => _auth.currentUser;

  // Sign Up
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Sign In
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Forgot Password
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // Email Verification
  Future<void> sendEmailVerification() async {
    await _auth.currentUser?.sendEmailVerification();
  }

  // Password Change
  Future<void> updatePassword(String newPassword) async {
    await _auth.currentUser?.updatePassword(newPassword);
  }

  // Reload user to get latest status (e.g. email verified)
  Future<void> reloadUser() async {
    await _auth.currentUser?.reload();
  }
}
