import 'package:flutter/material.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.blueAccent,
          child: Center(
            child: Text(
              "Stories Page",
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

