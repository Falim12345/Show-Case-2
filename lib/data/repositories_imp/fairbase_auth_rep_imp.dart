// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

class AuthManager {
  final FirebaseAuth _firebaseAuth;
  AuthManager({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  Future<void> onEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      print('User created with ID: ${credential.user?.uid}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
