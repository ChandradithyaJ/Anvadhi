import 'package:flutter/material.dart';
import './customWidgets/MapPage.dart';
import './customWidgets/navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  List<Map<String, dynamic>> ArtForms = [];
  Map<String, dynamic> selectedArtForm = {};

  /*** fetch art forms **/
  try{
    final artFormsRef = FirebaseFirestore.instance.collection('artForms');
    List<Map<String, dynamic>> allArtForms = [];
    await artFormsRef.get().then((snapshot) => {
      snapshot.docs.forEach((element) {
        allArtForms.add(element.data());
      })
    });
    ArtForms = allArtForms;
    if(ArtForms.isNotEmpty) selectedArtForm = ArtForms[0];
  } catch (err) {
    print('Error loading documents: $err');
  }

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.blueAccent,
          child: const Center(
            child: Text(
              "Anvadhi",
              style: TextStyle(
                fontSize: 40.0,
              ),
            ),
          ),
        ),
      ),
      body: MapPage(ArtForms: ArtForms, selectedArtForm: selectedArtForm),
      bottomNavigationBar: const Navbar(),
    ),
  ));
}


