import 'package:flutter/material.dart';
import 'auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {

  /** Connecting app to Firebase **/
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // state variable used in the app
  List<Map<String, dynamic>> ArtForms = [];
  Map<String, dynamic> selectedArtForm = {};

  /*** fetch art forms ***/
  final artFormsRef = FirebaseFirestore.instance.collection('artForms');
  try {
    List<Map<String, dynamic>> allArtForms = [];
    await artFormsRef.get().then((snapshot) => {
          snapshot.docs.forEach((element) {
            allArtForms.add(element.data());
          })
        });
    ArtForms = allArtForms;
    if (ArtForms.isNotEmpty) selectedArtForm = ArtForms[0];
  } catch (err) {
    print('Error loading documents: $err');
  }

  /** fetch the art forms if there are any changes **/
  artFormsRef.snapshots().listen(
    (snapshot) {
      ArtForms.clear();
      snapshot.docs.forEach((doc) {
        ArtForms.add(doc.data());
      });
    },
    onError: (error) => print("Listen failed: $error"),
  );

  runApp(MaterialApp(
    title: 'Anvadhi',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(scaffoldBackgroundColor: Colors.purpleAccent[100]),
    home: AuthPage(ArtForms: ArtForms, selectedArtForm: selectedArtForm),
  ));
}
