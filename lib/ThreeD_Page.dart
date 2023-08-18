
import 'package:anvadhi/customWidgets/ProfilePage.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:flutter/material.dart';
import 'package:anvadhi/Side_menu.dart';

class ThreeD_Page extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);  
    
       return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.velocity.pixelsPerSecond.dx > -1) {
          // Swiped from left to right, navigate to the next page
          Navigator.of(context).pushNamed('/Side_menu');
          print("swiped right");
        }
      },
  
    child: Scaffold(
      body: Center(

        child: Cube(
          onSceneCreated: (Scene scene) {
            final object = Object(fileName: 'lib/assets/images/model/Model_culturia/Culturia_text.obj',backfaceCulling: true);
           double scaleFactor = 1;
                object.scale.setValues(scaleFactor, scaleFactor, scaleFactor);
                object.rotation.setValues(0, 50, 0);
                object.position.setValues(1.5, 0, 1);
                object.updateTransform();
            scene.world.add(object);
            scene.camera.zoom = 2;
        
          },
        ),
      ),
    ) 
    );

    }
    }
  
  