import 'package:flutter/material.dart';
import './customWidgets/YearRange.dart';
import './customWidgets/selectArtForm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './customWidgets/HomePage.dart';
import './customWidgets/ProfilePage.dart';
import './customWidgets/MapPage.dart';
import './customWidgets/StoriesPage.dart';
import './customWidgets/navbar.dart';


void main() async{
  /*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  runApp(MaterialApp(
    home: Navbar(),
  ));
}





