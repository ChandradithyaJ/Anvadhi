import 'package:anvadhi/Side_menu.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:anvadhi/ThreeD_Page.dart';
import 'package:anvadhi/services/routes.dart';
import 'package:anvadhi/Side_menu.dart';
import 'package:anvadhi/Liquid_drop_trying.dart';



class Hidden_draww extends StatefulWidget {
  @override
  _Hidden_draww createState() => _Hidden_draww();
}
 
class _Hidden_draww extends State<Hidden_draww> {
  List<ScreenHiddenDrawer> _pages = [];
  @override
  void initState() {
    super.initState();
  
  _pages = [
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: "lets rock mf ",
        colorLineSelected: Colors.purpleAccent,
        baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 28.0 ),
        selectedStyle: TextStyle( color: Colors.orange ),
      ),
      ThreeD_Page(),
    ),
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: "lets rock mf 2 ",
        colorLineSelected: Colors.purpleAccent,
        baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 28.0 ),
        selectedStyle: TextStyle( color: Colors.orange ),
      ),
      LiquidDropTrying(),
    ),
  ];
  } 
  @override
  Widget build(BuildContext context)
  {
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
  