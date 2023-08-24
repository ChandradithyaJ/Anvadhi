/// Widget for the bookmarked courses part of the profile page

import 'package:flutter/material.dart';
import 'package:anvadhi/library/User.dart' as currentUser;
import 'package:firebase_auth/firebase_auth.dart';

class Profile_detaila1 extends StatelessWidget {
  dynamic verified = FirebaseAuth.instance.currentUser?.emailVerified;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, currentUser.bookmarks.length.toString(),
              'Bookmarked courses'),
        ],
      );
  Widget buildDivider() => Container(
        height: 24,
        child: const VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 6),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
