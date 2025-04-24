import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Auth state stream
  Stream<User?> get user => _auth.authStateChanges();

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      debugPrint('User ${result.user?.email} signed in successfully');
      return result.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('Login error: ${e.code}');
      throw _handleAuthError(e);
    }
  }

  // Register with email and password
  Future<User?> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      debugPrint('User ${result.user?.email} registered successfully');
      return result.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('Registration error: ${e.code}');
      throw _handleAuthError(e);
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      debugPrint('User signed out successfully');
    } on FirebaseAuthException catch (e) {
      debugPrint('Sign out error: ${e.code}');
      throw _handleAuthError(e);
    }
  }

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Password reset with enhanced error handling
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      debugPrint('Password reset email sent to $email');
    } on FirebaseAuthException catch (e) {
      debugPrint('Password reset error: ${e.code}');
      throw _handleAuthError(e);
    }
  }

  // Handle authentication errors
  String _handleAuthError(FirebaseAuthException error) {
    debugPrint('Auth Error: ${error.code} - ${error.message}');

    switch (error.code) {
      case 'invalid-email':
        return 'Please enter a valid email address';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'user-not-found':
        return 'No account found for this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'email-already-in-use':
        return 'This email is already registered';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled';
      case 'weak-password':
        return 'Password must be at least 6 characters';
      case 'network-request-failed':
        return 'Network error. Please check your connection';
      case 'too-many-requests':
        return 'Too many attempts. Try again later';
      case 'invalid-credential':
        return 'Invalid login credentials';
      default:
        return 'An error occurred: ${error.message ?? 'Please try again'}';
    }
  }

  // Additional utility method for email verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      debugPrint('Verification email sent');
    } on FirebaseAuthException catch (e) {
      debugPrint('Email verification error: ${e.code}');
      throw _handleAuthError(e);
    }
  }
}
