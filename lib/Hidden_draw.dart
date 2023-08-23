import 'package:anvadhi/pages/report_page.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:anvadhi/pages/Home_screen_culturia.dart';
import 'package:anvadhi/pages/ProfilePage.dart';
import 'package:anvadhi/onBoard_screens.dart';
import 'package:anvadhi/pages/Add_post.dart';
import './pages/Arts_display.dart';
import 'package:anvadhi/pages/MapPage.dart';

class Hidden_draww extends StatefulWidget {
  Map<String, dynamic> selectedArtForm;
  List<Map<String, dynamic>> ArtForms;

  Hidden_draww({required this.ArtForms, required this.selectedArtForm})
      : super();

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
          selectedStyle: const TextStyle(color: Colors.orange),
        ),
        Home_screen_culturia(
            ArtForms: widget.ArtForms, selectedArtForm: widget.selectedArtForm),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Explore",
          colorLineSelected: Colors.purpleAccent,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          selectedStyle: const TextStyle(color: Colors.orange),
        ),
        MapPage(
            ArtForms: widget.ArtForms, selectedArtForm: widget.selectedArtForm),
      ),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Learn",
            colorLineSelected: Colors.purpleAccent,
            baseStyle:
                TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
            selectedStyle: const TextStyle(color: Colors.orange),
          ),
          ArtsDisplay(
              ArtForms: widget.ArtForms,
              selectedArtForm: widget.selectedArtForm)),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Profile",
          colorLineSelected: Colors.purpleAccent,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          selectedStyle: const TextStyle(color: Colors.orange),
        ),
        ProfilePage(
            ArtForms: widget.ArtForms, selectedArtForm: widget.selectedArtForm),
      ),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Share art form",
            colorLineSelected: Colors.purpleAccent,
            baseStyle:
                TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
            selectedStyle: const TextStyle(color: Colors.orange),
          ),
          AddpostList(ArtForms: widget.ArtForms)),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Report",
          colorLineSelected: Colors.purpleAccent,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          selectedStyle: const TextStyle(color: Colors.orange),
        ),
        ReportPage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.purple,
      backgroundColorAppBar: Colors.purple[600],
      screens: _pages,
      withShadow: true,
      slidePercent: 80.0,
      enableCornerAnimation: true,
      enableShadowItensMenu: true,
      enableScaleAnimation: true,
      actionsAppBar: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ArtsDisplay(
                        ArtForms: widget.ArtForms,
                        selectedArtForm: widget.selectedArtForm)));
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AddpostList(ArtForms: widget.ArtForms)));
          },
        )
      ],
      verticalScalePercent: 80.0,
      contentCornerRadius: 40.0,
      leadingAppBar: const Icon(Icons.menu, color: Colors.white),
    );
  }
}
