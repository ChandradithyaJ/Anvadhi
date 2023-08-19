import 'package:anvadhi/Side_menu.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:anvadhi/ThreeD_Page.dart';
<<<<<<< Updated upstream
import 'package:anvadhi/services/routes.dart';
import 'package:anvadhi/Side_menu.dart';
import 'package:anvadhi/Liquid_drop_trying.dart';


=======
import 'package:anvadhi/Home_screen_culturia.dart';
import 'package:anvadhi/Home_screen_culturia_artist.dart';
import 'package:anvadhi/ProfilePage.dart';
import 'package:anvadhi/animation_try.dart';
import 'package:anvadhi/onBoard_screens.dart';
import 'package:anvadhi/Add_post.dart';
import 'package:anvadhi/Arts_display.dart';
import 'package:anvadhi/customWidgets/MapPage.dart';
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
      LiquidDropTrying(),
    ),
  ];
  } 
=======
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Stories",
          colorLineSelected: Colors.purpleAccent,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          selectedStyle: TextStyle(color: Colors.orange),
        ),
        ArtsDisplay()
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
      // ScreenHiddenDrawer(
      //   ItemHiddenMenu(
      //     name: "Artists",
      //     colorLineSelected: Colors.purpleAccent,
      //     baseStyle:
      //         TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
      //     selectedStyle: TextStyle(color: Colors.orange),
      //   ),
      //   Home_screen_culturia_artist(),
      // ),
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
          name: "3D",
          colorLineSelected: Colors.purpleAccent,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          selectedStyle: TextStyle(color: Colors.orange),
        ),
        CombinedPage(),
      ),
        ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "addpost",
          colorLineSelected: Colors.purpleAccent,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          selectedStyle: TextStyle(color: Colors.orange),
        ),
        Addpost()
      ),
      // ScreenHiddenDrawer(
      //   ItemHiddenMenu(
      //     name: "onBoard",
      //     colorLineSelected: Colors.purpleAccent,
      //     baseStyle:
      //     TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
      //     selectedStyle: TextStyle(color: Colors.orange),
      //   ),
      //   OnBoardingScreen(),
      // ),
    ];
  }

>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context)
  {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.purple,
      backgroundColorAppBar: Colors.purple[200],
      screens: _pages,
      actionsAppBar: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {}
        ),
        IconButton(
          icon: Icon(Icons.help, color: Colors.white),
          
          onPressed: () {},
        ),
       
      ],
      //    typeOpen: TypeOpen.FROM_RIGHT,
      //    disableAppBarDefault: false,
      enableCornerAnimation: true ,
      enableShadowItensMenu: true,
      //    enableCornerAnimin: true,
      slidePercent: 80.0,
      verticalScalePercent: 80.0,
      contentCornerRadius: 40.0,
    
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
  