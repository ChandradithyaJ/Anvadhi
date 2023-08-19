import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'Arts_display.dart';
class CombinedPage extends StatefulWidget {
  @override
  _CombinedPageState createState() => _CombinedPageState();
}

class _CombinedPageState extends State<CombinedPage>
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
      appBar: AppBar(
        title: Text('Combined Animation and 3D'),
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              // Add your onTap behavior for the animation section
            },
            child: Container(
              height: 300, // Adjust the height as needed
              child: Center(
                child: Lottie.network(
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
          ),
          GestureDetector(
            onTap: () {
              // navigate to the arts page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ArtsDisplay()),);
            },
            child: Container(
              height: 300, // Adjust the height as needed
              child: Center(
                child: AnimatedContainer(
                  curve: Curves.bounceInOut,
                  transform: Matrix4.identity().scaled(1.0),
                  duration: Duration(milliseconds: 200),
                  child: Cube(
                    onSceneCreated: (Scene scene) {
                      final object = Object(
                          fileName:
                              'lib/assets/images/model/Model_culturia/Culturia_text.obj',
                          backfaceCulling: true);
                      double scaleFactor = 1;
                      object.scale.setValues(scaleFactor, scaleFactor, scaleFactor);
                      object.rotation.setValues(0, 50, 0);
                      object.position.setValues(1.5, 0, 1);
                      object.updateTransform();
                      // Add animations
                      scene.world.add(object);
                      // Set camera zoom
                      scene.camera.zoom = 2;
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


