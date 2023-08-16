import 'package:flutter_cube/flutter_cube.dart';
import 'package:flutter/material.dart';

class ThreeD_Page extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Cube(
          onSceneCreated: (Scene scene) {
            scene.world.add(Object(fileName: 'lib/assets/images/model/Amphora_44_hp_retopo_uv_closed_rect.obj'));
            scene.camera.zoom = 12;
          },
        ),
      ),
    );
  }
  }