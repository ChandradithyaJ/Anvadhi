import 'package:anvadhi/customWidgets/auth_page.dart';
import 'package:anvadhi/customWidgets/profile_Widget.dart';
import 'package:flutter/material.dart';
import "package:anvadhi/customWidgets/Profile_detaila1.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:anvadhi/User.dart' as currentUser;

class ProfilePage extends StatefulWidget {
  Map<String, dynamic> selectedArtForm;
  List<Map<String, dynamic>> ArtForms;

  ProfilePage({ required this.ArtForms, required this.selectedArtForm }) : super();

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    String? displayName = currentUser.displayName != '' ? currentUser.displayName : user?.displayName;
    String defaultImage = 'https://www.shutterstock.com/image-illustration/landscape-illustration-game-breath-wild-wallpaper-2216058639';

    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ProfileWidget(
              imagePath: user?.photoURL ?? defaultImage,
              onClicked: () async {},
            ),
          ),
          const SizedBox(height: 24),
          Column(
            children: [
              Text(
                displayName ?? 'Guest user',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          Profile_detaila1(),
          const SizedBox(height: 48),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'About',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  user?.email ?? 'Learn anonymously too!',
                  style: const TextStyle(fontSize: 16, height: 1.4),
                ),
                const SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        FirebaseAuth.instance.signOut();
                        currentUser.displayName = '';
                        currentUser.bookmarks = [];
                        currentUser.email = '';
                        currentUser.uid = '';
                        currentUser.getFirestore = false;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              AuthPage(ArtForms: widget.ArtForms, selectedArtForm: widget.selectedArtForm),
                          )
                        );
                      },
                      child: const Icon(
                        Icons.logout_outlined
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}