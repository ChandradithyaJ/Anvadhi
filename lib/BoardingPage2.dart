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
          SizedBox(height: 5),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(60.0),
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
          ),
        ],
      ),
    );
  }
}
