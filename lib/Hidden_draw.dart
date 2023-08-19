import 'package:anvadhi/customWidgets/HomePage.dart';
import 'package:anvadhi/report_page.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:anvadhi/ThreeD_Page.dart';
import 'package:flutter/material.dart';
import 'package:anvadhi/Home_screen_culturia.dart';
import 'package:anvadhi/Home_screen_culturia_artist.dart';
import 'package:anvadhi/ProfilePage.dart';
import 'package:anvadhi/Side_menu.dart';
import 'package:anvadhi/Liquid_drop_trying.dart';
import 'package:anvadhi/animation_try.dart';
import 'package:anvadhi/onBoard_screens.dart';
import 'package:anvadhi/Liquid_drop_trying.dart';
import 'package:anvadhi/customWidgets/MapPage.dart';

class Hidden_draww extends StatefulWidget {
  Map<String, dynamic> selectedArtForm;
  List<Map<String, dynamic>> ArtForms;

  Hidden_draww({ required this.ArtForms, required this.selectedArtForm }) : super();

  @override
  State<Hidden_draww> createState() => _Hidden_draww();
}

class _Hidden_draww extends State<Hidden_draww> {
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Home",
          colorLineSelected: Colors.purpleAccent,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          selectedStyle: TextStyle(color: Colors.orange),
        ),
        Home_screen_culturia(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Explore",
          colorLineSelected: Colors.purpleAccent,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          selectedStyle: TextStyle(color: Colors.orange),
        ),
        MapPage(ArtForms: widget.ArtForms, selectedArtForm: widget.selectedArtForm),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Stories",
          colorLineSelected: Colors.purpleAccent,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          selectedStyle: TextStyle(color: Colors.orange),
        ),
        LiquidDropTrying(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Profile",
          colorLineSelected: Colors.purpleAccent,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          selectedStyle: TextStyle(color: Colors.orange),
        ),
        ProfilePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Artists",
          colorLineSelected: Colors.purpleAccent,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          selectedStyle: TextStyle(color: Colors.orange),
        ),
        Home_screen_culturia_artist(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Report",
          colorLineSelected: Colors.purpleAccent,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          selectedStyle: TextStyle(color: Colors.orange),
        ),
        ReportPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Animation",
          colorLineSelected: Colors.purpleAccent,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          selectedStyle: TextStyle(color: Colors.orange),
        ),
        Animation_try(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "3D",
          colorLineSelected: Colors.purpleAccent,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          selectedStyle: TextStyle(color: Colors.orange),
        ),
        ThreeD_Page(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.teal,
      backgroundColorAppBar: Colors.teal,
      screens: _pages,
      //    typeOpen: TypeOpen.FROM_RIGHT,
      //    disableAppBarDefault: false,
      //    enableScaleAnimin: true,
      //    enableCornerAnimin: true,
      slidePercent: 80.0,
      verticalScalePercent: 80.0,
      contentCornerRadius: 40.0,
      //    iconMenuAppBar: Icon(Icons.menu),
      //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
      //    whithAutoTittleName: true,
      //    styleAutoTittleName: TextStyle(color: Colors.red),
      //    actionsAppBar: <Widget>[],
      //    backgroundColorContent: Colors.blue,
      //    elevationAppBar: 4.0,
      //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
      //    enableShadowItensMenu: true,
      //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
      //    whithAutoTittleName: true,
      //    styleAutoTittleName: TextStyle(color: Colors.red),
      //    actionsAppBar: <Widget>[],
      //    backgroundColorContent: Colors.blue,
      //    elevationAppBar: 4.0,
      //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
      //    enableShadowItensMenu: true,
      //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
      //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
      //    whithAutoTittleName: true,
      //    styleAutoTittleName: TextStyle(color: Colors.red),
      //    actionsAppBar: <Widget>[],
      //    backgroundColorContent: Colors.blue,
      //    elevationAppBar: 4.0,
      //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
      //    enableShadowItensMenu: true,
      //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
      //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news
    );
  }
}
