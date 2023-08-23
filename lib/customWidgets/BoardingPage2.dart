import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BoardingPage2 extends StatefulWidget {
  @override
  _BoardingPage2 createState() => _BoardingPage2();
}

class _BoardingPage2 extends State<BoardingPage2>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
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
          const Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30.0, 40.0, 50.0, 0.0),
              child: Text(
                '<—   Swipe  -->',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 40.0, 0, 0),
            child: Column(
              children: [
                Text(
                  'Lets, Connect Art with World!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'IndieFlower',
                  ),
                ),

                // SizedBox(height: 50),
              ],
            ),
          ),
          Container(
            height: 450, // Adjust the height as needed
            child: Center(
              child: Lottie.asset(
                'lib/assets/animations/animation_lll7id62.json',
                controller: _controller,
                onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..forward();
                  // Loop it
                  _controller.repeat();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
