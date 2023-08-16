import 'package:anvadhi/customWidgets/profile_Widget.dart';
import 'package:flutter/material.dart';
import 'package:anvadhi/customWidgets/app_bar.dart';
import 'package:anvadhi/models/user_details.dart';
import 'package:anvadhi/utils/Sample_user.dart';
import "package:anvadhi/customWidgets/profile_Widget.dart";
import "package:anvadhi/customWidgets/Profile_detaila1.dart";
import 'package:anvadhi/customWidgets/app_bar.dart';
import 'package:anvadhi/models/user_details.dart';
import 'package:anvadhi/utils/Sample_user.dart';



class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
     final user = user_Preferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Profile_detaila1(),
          const SizedBox(height: 48),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(user_details user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

 

  Widget buildAbout( user_details user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}