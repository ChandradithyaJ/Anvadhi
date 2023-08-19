import 'package:anvadhi/Arts_display.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream


class ThreeD_Page extends StatefulWidget {

 _ThreeD_Page createState() => _ThreeD_Page();
}
class _ThreeD_Page extends State<ThreeD_Page> {
  double scaleFactor = 1.0;
=======
import 'package:lottie/lottie.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:anvadhi/services/routes.dart';







class CombinedPage extends StatefulWidget {
  @override
  _CombinedPageState createState() => _CombinedPageState();
}

class _CombinedPageState extends State<CombinedPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
    // ThemeData themeData = Theme.of(context);
      // backgroundColor =Colors.teal; 

    
       return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.velocity.pixelsPerSecond.dx > -1) {
          // Swiped from left to right, navigate to the next page
          Navigator.of(context).pushNamed('/Side_menu');
          print("swiped right");
        }
      },
  
    child: Scaffold(
    backgroundColor : Colors.deepPurple
    ,

      body: Center(

        child: AnimatedContainer(
          curve: Curves.bounceInOut,
          transform: Matrix4.identity().scaled(1.0),
          duration: Duration( milliseconds:200),
          

          child: Cube(
            onSceneCreated: (Scene scene) {
              final object = Object(fileName: 'lib/assets/images/model/Model_culturia/Culturia_text.obj',backfaceCulling: true);
             double scaleFactor = 1;
                  object.scale.setValues(scaleFactor, scaleFactor, scaleFactor);
                  object.rotation.setValues(0, 50, 0);
                  object.position.setValues(1.5, 0, 1);
                  object.updateTransform();
                  //add animations 
                  

              scene.world.add(object);
              //add animation
              
              scene.camera.zoom = 2;
          
            },
          ),
        ),
      ),
    ) 
    );

    }
    }
  
  
=======
    return Scaffold(
      body: ListView(
        children: <Widget>[
          // First, add your animation
          Container(
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

          // Then, add your 3D model
            GestureDetector(
              onDoubleTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArtsDisplay(),
                ),
              ),
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

>>>>>>> Stashed changes
