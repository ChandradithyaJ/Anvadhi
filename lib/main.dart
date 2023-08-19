import 'package:anvadhi/customWidgets/MapPage.dart';
import 'package:flutter/material.dart';
import './customWidgets/YearRange.dart';
import './customWidgets/navbar.dart';
import './customWidgets/selectArtForm.dart';
import './services/map.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Map<String, dynamic> selectedArtForm = {};
  List<Map<String, dynamic>> ArtForms = [];

  /*** fetch art forms ***/
  try{
    final CollectionReference artFormsRef = FirebaseFirestore.instance.collection('artForms');
    List<Map<String, dynamic>> allArtForms = [];
    await artFormsRef.get().then((snapshot) {
      List<Map<String, dynamic>> documents = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      allArtForms = documents;
    });
    ArtForms = allArtForms;
    if(ArtForms.isNotEmpty) selectedArtForm = ArtForms[0];
  } catch (err) {
    print('Error fetching documents: $err');
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


