import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.blueAccent,
          child: Center(
            child: Text(
              "Profile Page",
              style: TextStyle(
                fontSize: 40.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

