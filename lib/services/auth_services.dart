import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:anvadhi/User.dart' as currentUser;

class AuthService {
  signInWithGoogle() async {
    //interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // new creds for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    Map<String, dynamic> user = {
      'uid': FirebaseAuth.instance.currentUser?.uid,
      'bookmarks': [],
      'displayName': FirebaseAuth.instance.currentUser?.displayName,
      'email': FirebaseAuth.instance.currentUser?.email
    };
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    dynamic reqDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if(!reqDoc.exists()) await FirebaseFirestore.instance.collection('users').doc(uid).set(user, SetOptions(merge: true));

    final usersRef = FirebaseFirestore.instance.collection('artForms');
    List<Map<String, dynamic>> allUsers = [];
    await usersRef.get().then((snapshot) => {
      snapshot.docs.forEach((element) {
        allUsers.add(element.data());
      })
    });
    Map<String, dynamic> reqUser = allUsers.firstWhere((element) => element['uid'] == FirebaseAuth.instance.currentUser?.uid);

    currentUser.displayName = FirebaseAuth.instance.currentUser?.displayName;
    currentUser.uid = FirebaseAuth.instance.currentUser?.uid;
    currentUser.email = FirebaseAuth.instance.currentUser?.email;
    currentUser.bookmarks = reqUser['bookmarks'];
  }
}