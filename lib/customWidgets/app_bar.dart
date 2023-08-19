import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      onPressed: () {},
    ),
    //  bottom: TabBar(
    //  tabs: <Widget>[
    //    Tab(
    //       icon: const Icon(Icons.cloud_outlined),
    //       text: "Buddy cloud",
    //     ),

    //  ]),
    actions: <Widget>[
      IconButton(
          icon: Icon(
            Icons.help,
          ),
          onPressed: () {}),
      TextButton(onPressed: () {}, child: const Text("hehehe")),
    ],
  );
}
