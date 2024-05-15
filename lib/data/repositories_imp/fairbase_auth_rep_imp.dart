import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImp {
  AuthRepositoryImp() : _firebaseAuth = GetIt.I<FirebaseAuth>();
  final FirebaseAuth _firebaseAuth;

  Future<void> onEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      if (credential.user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_uid', credential.user!.uid);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {}
    } catch (e) {
      // print(e);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    final loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success) {
      final accessToken = loginResult.accessToken;
      if (accessToken != null) {
        final facebookAuthCredential =
            FacebookAuthProvider.credential(accessToken.token);

        return FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
      } else {
        throw Exception('Access token is null');
      }
    } else {
      throw Exception('Facebook sign in failed');
    }
  }
}
