import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    //interactive signin process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //new creds for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}