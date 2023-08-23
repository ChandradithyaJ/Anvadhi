import 'package:anvadhi/pages/Add_post.dart';
import 'package:anvadhi/Hidden_draw.dart';
import 'package:anvadhi/unused/ThreeD_Page.dart';
import 'package:flutter/material.dart';
import 'package:anvadhi/pages/Home_screen_culturia.dart';
import 'package:anvadhi/pages/ProfilePage.dart';
import 'package:anvadhi/customWidgets/Side_menu.dart';
import 'package:anvadhi/unused/animation_try.dart';
import 'package:anvadhi/onBoard_screens.dart';
import 'package:anvadhi/pages/MapPage.dart';

class AppRoutes {
  List<Map<String, dynamic>> ArtForms = [];
  Map<String, dynamic> selectedArtForm = {};
  AppRoutes({required this.ArtForms, required this.selectedArtForm});

  static const String home = '/';
  static const String Sidemenu = '/Sidemenu';
  static const String Profile = '/profile';
  static const String LiquidDrop = '/liquid_drop';
  static const String Anim = '/animation_try';
  static const String OnBoard = '/onBoard';
  static const String ThreeD = '/ThreeD';
  static const String culturia = '/Home_screen_culturia';
  static const String arts = '/Home_screen_culturia_artist';
  static const String Mapping = '/MapPage';
  static const String Smenu = '/HiddenDrawer';
  static const String Addposts = '/Addpost';
  static const String FullScreen = '/FullScreen';

  Map<String, WidgetBuilder> getRoutes() {
    Map<String, WidgetBuilder> routes = {
      home: (context) => Side_menu(),
      Smenu: (context) => Hidden_draww(
            ArtForms: ArtForms,
            selectedArtForm: selectedArtForm,
          ),
      Sidemenu: (context) => Side_menu(),
      Profile: (context) =>
          ProfilePage(ArtForms: ArtForms, selectedArtForm: selectedArtForm),
      Anim: (context) => Animation_try(),
      OnBoard: (context) => OnBoardingScreen(
          ArtForms: ArtForms, selectedArtForm: selectedArtForm),
      culturia: (context) => Home_screen_culturia(
          ArtForms: ArtForms, selectedArtForm: selectedArtForm),
      Addposts: (context) => AddpostList(ArtForms: ArtForms),
      ThreeD: (context) =>
          CombinedPage(ArtForms: ArtForms, selectedArtForm: selectedArtForm),
      Mapping: (context) =>
          MapPage(ArtForms: ArtForms, selectedArtForm: selectedArtForm),
    };

    return routes;
  }
}
