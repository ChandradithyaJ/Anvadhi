import 'package:flutter/material.dart';
import './customWidgets/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

  artFormsRef.snapshots().listen((snapshot){
    ArtForms.clear();
    snapshot.docs.forEach((doc) {ArtForms.add(doc.data()); });
  },
    onError: (error) => print("Listen failed: $error"),
  );

  runApp(MaterialApp(
    title: 'Anvadhi',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.purpleAccent[100]
    ),
    home: AuthPage(ArtForms: ArtForms, selectedArtForm: selectedArtForm),
  ));
}