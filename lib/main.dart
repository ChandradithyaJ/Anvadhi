import 'package:flutter/material.dart';
import './customWidgets/YearRange.dart';
import './customWidgets/navbar.dart';
import './customWidgets/selectArtForm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  /*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
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
      body: const Column(
        children: [
          SelectArtForm(),
          YearRange()
        ],
      ),
      bottomNavigationBar: const Navbar(),
    ),
  ));
}


