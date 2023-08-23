import 'package:anvadhi/onBoard_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'customWidgets/login_or_register_page.dart';

class AuthPage extends StatefulWidget {
  List<Map<String, dynamic>> ArtForms;
  Map<String, dynamic> selectedArtForm;
  AuthPage({required this.ArtForms, required this.selectedArtForm}) : super();

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return OnBoardingScreen(
              ArtForms: widget.ArtForms,
              selectedArtForm: widget.selectedArtForm);
        } else {
          return const LoginOrRegisterPage();
        }
      },
    ));
  }
}
