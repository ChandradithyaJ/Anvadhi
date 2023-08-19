// import 'package:anvadhi/Side_menu.dart';
// import 'package:flutter/material.dart';
// import './customWidgets/YearRange.dart';
// import './customWidgets/navbar.dart';
// import './customWidgets/selectArtForm.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// void main() async{
//   /*await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );*/
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Title(
//           color: Colors.blueAccent,
//           child: const Center(
//             child: Text(
//               "Anvadhi",
//               style: TextStyle(
//                 fontSize: 40.0,
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           //add button elevated from widgets 
//           // Column(
//           //   children: [ ElevatedButton(onPressed: () { NavigationDrawer();}, child: Text("check"),)],
//           // ),
//           SelectArtForm(),
//           YearRange()
//         ],
//       ),
       
//       bottomNavigationBar: const Navbar(),
//     ),
//   ));
// }

import 'package:anvadhi/onBoard_screens.dart';
import 'package:flutter/material.dart';
import 'package:anvadhi/services/routes.dart';
import 'package:anvadhi/ProfilePage.dart';
import 'package:anvadhi/onBoard_screens.dart';
import 'package:anvadhi/animation_try.dart';
import 'package:anvadhi/Liquid_drop_trying.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: AppRoutes.home,
      // routes: AppRoutes.routes,
      home: LiquidDropTrying(), // Change this to the desired page widget
    );
  }
}

