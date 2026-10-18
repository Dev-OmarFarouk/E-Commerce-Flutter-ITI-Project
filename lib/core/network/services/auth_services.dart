import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../feature/Login/Login.dart';
import '../../resources/snack_bar.dart';

Future<void> logout(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,

        MaterialPageRoute(builder: (context) => Login()),
        (route) => false,
      );
    }
  } on FirebaseAuthException catch (e) {
    if (context.mounted) {
      showMySnackBar(
        msg: e.message ?? "Error Occurred",
        type: AnimatedSnackBarType.error,
        context: context,
      );
    }
  } catch (e) {
    if (context.mounted) {
      showMySnackBar(
        msg:"Error Occurred",
        type: AnimatedSnackBarType.error,
        context: context,
      );
    }
  }
}

//----------------------------------

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Email is required';
    }
    if (!email.contains('@')) {
      return 'Email must contain @';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }


  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw AuthException('No account found with this email.');
        case 'wrong-password':
        case 'invalid-credential':
          throw AuthException('Wrong email or password.');
        case 'invalid-email':
          throw AuthException('Invalid email address.');
        case 'user-disabled':
          throw AuthException('This account has been disabled.');
        default:
          throw AuthException(
            e.message ?? 'Something went wrong while logging in.',
          );
      }
    }
  }

  Future<void> signup({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      await cred.user?.reload();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw AuthException('This email is already registered.');
        case 'invalid-email':
          throw AuthException('Invalid email address.');
        case 'weak-password':
          throw AuthException('Password is too weak.');
        default:
          throw AuthException(
            e.message ?? 'Something went wrong while creating the account.',
          );
      }
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}

