import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.blue[500],
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.blue[500],
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    'Map',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.blue[500],
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    'Stories',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.blue[500],
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}