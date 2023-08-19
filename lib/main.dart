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


import 'package:anvadhi/Scroable_parallex.dart';
import 'package:anvadhi/onBoard_screens.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:anvadhi/Home_screen_culturia.dart';
import 'package:anvadhi/services/FireStore_services.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor:Colors.purple[100]),
      debugShowCheckedModeBanner: false,
      home:  Scaffold(

        body: Center(

          child: Home_screen_culturia(),
          //child: ExampleParallax(), 
        ),
      ),
    );
  }
}












// import 'package:anvadhi/services/routes.dart';

// import 'package:anvadhi/ProfilePage.dart';
// import 'package:anvadhi/onBoard_screens.dart';
// import 'package:anvadhi/animation_try.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // initialRoute: AppRoutes.home,
//       // routes: AppRoutes.routes,
//       home: ExampleParallax(), // Change this to the desired page widget
//     );
//   }
// }

// class Firestore_try extends StatefulWidget {
//   const Firestore_try({Key? key}) : super(key: key);
//   @override
//   _Firestore_tryState createState() => _Firestore_tryState();
// }

// class _Firestore_tryState extends State<Firestore_try> {
//   @override
//   Widget build(BuildContext context) {

//    final Storage storage = Storage();
//     //storage 
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(

//           children: [
//             Text("Firestore_try"),
//             Container(
//               color: Colors.red,
//               child: ElevatedButton(
                
//                 onPressed: () async {
//                   final image_result =
//                       await FilePicker.platform.pickFiles(
//                         type: FileType.image,
//                         allowMultiple: false,
//                         allowedExtensions:['png', 'jpg', 'jpeg' ], );
            
//                   if (image_result == null) {
//                    ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text("File not Picked"),
//                       ),
//                     );
//                     return null;
//                   }
            
//                   final image_file = image_result.files.single.name;
//                   final image_path = image_result.files.single.path;
            
//                   storage.FilesUpload(image_file, image_path!).then((value) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text("File Uploaded"),
//                       ),
//                     );
//                   });
//                 },
//                 child: Text("check"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
