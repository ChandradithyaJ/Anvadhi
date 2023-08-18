
import 'package:anvadhi/ThreeD_Page.dart';
import 'package:flutter/material.dart';
import 'package:anvadhi/Home_screen_culturia.dart';
import 'package:anvadhi/Home_screen_culturia_artist.dart';
import 'package:anvadhi/ProfilePage.dart';
import 'package:anvadhi/Side_menu.dart';


//mannu add more 


class AppRoutes {
  static const String home = '/';
  static const String Sidemenu = '/Sidemenu';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => Side_menu(),
    Sidemenu: (context) => ThreeD_Page(),
  };
}
