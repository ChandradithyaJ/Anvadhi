/// Animation for the on boarding screen

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_cube/flutter_cube.dart';
import '../Hidden_draw.dart';

class BoardingPage3 extends StatefulWidget {
  List<Map<String, dynamic>> ArtForms;
  Map<String, dynamic> selectedArtForm;
  BoardingPage3({required this.ArtForms, required this.selectedArtForm})
      : super();

  @override
  _BoardingPage3 createState() => _BoardingPage3();
}

class _BoardingPage3 extends State<BoardingPage3>
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
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: 400, // Adjust the height as needed
            child: Center(
              child: Lottie.asset(
                'lib/assets/animations/animation_llhiqvqs.json',
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
          GestureDetector(
            onDoubleTap: () {
              // navigate to the arts page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Hidden_draww(
                            ArtForms: widget.ArtForms,
                            selectedArtForm: widget.selectedArtForm,
                          )));
            },
            child: Container(
              height: 200, // Adjust the height as needed
              child: Center(
                child: AnimatedContainer(
                  curve: Curves.bounceInOut,
                  transform: Matrix4.identity().scaled(1.0),
                  duration: Duration(milliseconds: 200),
                  child: Cube(
                    onSceneCreated: (Scene scene) {
                      final object = Object(
                          fileName:
                              'lib/assets/3D models/Logo/Culturia_text_final.obj',
                          backfaceCulling: true);
                      double scaleFactor = 1;
                      object.scale
                          .setValues(scaleFactor, scaleFactor, scaleFactor);
                      object.rotation.setValues(0, 50, -10);
                      object.position.setValues(0.3, 0, 0);

                      object.updateTransform();
                      // Add animations
                      scene.world.add(object);
                      // Set camera zoom
                      scene.camera.zoom = 12;
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
