import 'package:anvadhi/customWidgets/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:anvadhi/Hidden_draw.dart';
import './customWidgets/MapPage.dart';
import './customWidgets/navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:anvadhi/services/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  List<Map<String, dynamic>> ArtForms = [];
  Map<String, dynamic> selectedArtForm = {};

  /*** fetch art forms **/
  try {
    final artFormsRef = FirebaseFirestore.instance.collection('artForms');
    List<Map<String, dynamic>> allArtForms = [];
    await artFormsRef.get().then((snapshot) => {
          snapshot.docs.forEach((element) {
            allArtForms.add(element.data());
          })
        });
    ArtForms = allArtForms;
    if (ArtForms.isNotEmpty) selectedArtForm = ArtForms[0];
  } catch (err) {
    print('Error loading documents: $err');
  }

  runApp(MaterialApp(
    title: 'Anvadhi',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Hidden_draww(ArtForms: ArtForms, selectedArtForm: selectedArtForm),
    // initialRoute: AppRoutes.Smenu,
    // routes: AppRoutes.routes,
  ));
}

// class myapp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
    
//   }
// }

// class HomePagesss extends StatefulWidget {
//   @override
//   State<HomePagesss> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePagesss> {
//   List<Map<String, dynamic>> artForms = [];
//   Map<String, dynamic> selectArtForm = {};
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Title(
//           color: Colors.blueAccent,
//           child: Center(
//             child: Row(
//               children: [
//                 Container(
//                   color: Colors.amber,
//                   child: Text(
//                     "Anvadhi",
//                     style: TextStyle(
//                       fontSize: 40.0,
//                     ),
//                   ),
//                 ),
//                 Center(
//                   child: Container(
//                       color: Colors.amber,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, AppRoutes.Sidemenu);
//                         },
//                         child: Text("Login"),
//                       )),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//       // body: MapPage(ArtForms: artForms, selectedArtForm: selectArtForm),
//       // bottomNavigationBar: const Navbar(),
//     );
//   }
// }
