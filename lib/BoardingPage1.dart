import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BoardingPage1 extends StatefulWidget {
  @override
  _BoardingPage1 createState() => _BoardingPage1();
}

class _BoardingPage1 extends State<BoardingPage1>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            height: 600, // Adjust the height as needed
            child: Center(
              child: Lottie.network(
                'lib/assets/animations/animation_lll7kvpg.json',
                controller: _controller,
                onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..forward();
                
                  _controller.repeat();
                },
              ),
            ),
          ),
          const SizedBox(height: 5),

          Container(
            child: const Padding(
              padding: EdgeInsets.all(60.0),
              child: Column(
                children: [
                  Text(
                    'Welcome to',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'IndieFlower',
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Anvadhi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'IndieFlower',
                    ),
                  ),
                  // SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
