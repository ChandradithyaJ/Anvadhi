import 'package:flutter_cube/flutter_cube.dart';
import 'package:flutter/material.dart';


class ThreeD_Page extends StatefulWidget {

 _ThreeD_Page createState() => _ThreeD_Page();
}
class _ThreeD_Page extends State<ThreeD_Page> {
  double scaleFactor = 1.0;

  void _handleSwipe() {
    setState(() {
      // Change the scale factor on swipe
      // scaleFactor = scaleFactor == 1.0 ? 1.5 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
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
  
  