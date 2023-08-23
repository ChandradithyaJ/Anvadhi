import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Animation_try extends StatefulWidget {
  @override
  _Animation_tryState createState() => _Animation_tryState();
}

class _Animation_tryState extends State<Animation_try>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController( duration:Duration(seconds:2), vsync: this);
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      
    
          child: Lottie.network(
            'lib/assets/animations/animation_llhiqvqs.json',
            controller: _controller,
            onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..forward();
                     //loop it
              _controller.repeat(); 
            },

          
        ),
        // child: Lottie.network(
        //   'https://assets2.lottiefiles.com/packages/lf20_1qjzjw.json',
        //   controller: _controller,
        // ),
      ),
    );
  }
}
