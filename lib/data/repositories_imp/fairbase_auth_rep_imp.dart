import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImp {
  final FirebaseAuth _firebaseAuth;
  AuthRepositoryImp() : _firebaseAuth = GetIt.I<FirebaseAuth>();

  Future<void> onEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      if (credential.user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_uid', credential.user!.uid);
      }

      // print('User created with ID: ${credential.user?.uid}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
      }
    } catch (e) {
      // print(e);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

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
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Check if login was successful
    if (loginResult.status == LoginStatus.success) {
      final AccessToken? accessToken = loginResult.accessToken;
      if (accessToken != null) {
        // Create a credential from the access token
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(accessToken.token);

        // Once signed in, return the UserCredential
        return FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
      } else {
        throw Exception('Access token is null');
      }
    } else {
      // Handle case where login was not successful
      throw Exception('Facebook sign in failed');
    }
  }
}
