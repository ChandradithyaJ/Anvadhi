import 'package:flutter/material.dart';
import './customWidgets/YearRange.dart';
import './customWidgets/navbar.dart';
import './customWidgets/selectArtForm.dart';
import './services/map.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      body: Column(
        children: [
          SelectArtForm(),
          SizedBox(height: 10.0,),
          Map(),
          YearRange()
        ],
      ),
      bottomNavigationBar: const Navbar(),
    ),
  ));
}


