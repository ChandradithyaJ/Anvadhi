import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.blueAccent,
          child: Center(
            child: Text(
              "Map Page",
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