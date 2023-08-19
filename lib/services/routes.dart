
import 'package:anvadhi/ThreeD_Page.dart';
import 'package:flutter/material.dart';
import 'package:anvadhi/Home_screen_culturia.dart';
import 'package:anvadhi/Home_screen_culturia_artist.dart';
import 'package:anvadhi/ProfilePage.dart';
import 'package:anvadhi/Side_menu.dart';

<<<<<<< Updated upstream

//mannu add more 

=======
import 'package:anvadhi/animation_try.dart';
import 'package:anvadhi/onBoard_screens.dart';

import 'package:anvadhi/Add_post.dart';
import 'package:anvadhi/Arts_display.dart';
import 'package:anvadhi/FullScreen.dart';
import 'package:anvadhi/customWidgets/MapPage.dart';
>>>>>>> Stashed changes

class AppRoutes {
  static const String home = '/';
  static const String Sidemenu = '/Sidemenu';
  static const String Profile = '/profile';
  

<<<<<<< Updated upstream
  static final Map<String, WidgetBuilder> routes = {
    home: (context) => Side_menu(),
    Sidemenu: (context) => ThreeD_Page(),
    Profile: (context) => ProfilePage(),
  };
=======
  Map<String, WidgetBuilder> getRoutes() {
    Map<String, WidgetBuilder> routes = {
      home: (context) => Side_menu(),
      Smenu: (context) => Hidden_draww(
            ArtForms: ArtForms,
            selectedArtForm: selectedArtForm,
          ),
      Sidemenu: (context) => Side_menu(),
      Profile: (context) => ProfilePage(),

      Anim: (context) => Animation_try(),
      OnBoard: (context) => OnBoardingScreen(),
      culturia: (context) => Home_screen_culturia(),
      arts: (context) => Home_screen_culturia_artist(),
      Addposts: (context) => Addpost(),
      ThreeD: (context) => CombinedPage(),
      
      Mapping: (context) =>
          MapPage(ArtForms: ArtForms, selectedArtForm: selectedArtForm),
    };

    return routes;
  }
>>>>>>> Stashed changes
}
