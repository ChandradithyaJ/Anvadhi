import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _Navbar();
}

class _Navbar extends State<Navbar> {
  int currentIndex=0;
  final screens =[
    const Center(child: Text('Home',style: TextStyle(fontSize: 60))),
    const Center(child: Text('Map',style: TextStyle(fontSize: 60))),
    const Center(child: Text('Stories',style: TextStyle(fontSize: 60))),
    const Center(child: Text('Profile',style: TextStyle(fontSize: 60))),
    // const HomePage(),
    // const MapPage(),
    // const StoriesPage(),
    // const ProfilePage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.blueAccent,
          child: const Center(
            child: Text(
              "Anvadhi",
              style: TextStyle(
                fontSize: 40.0,
              ),
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        selectedFontSize: 17,
        showUnselectedLabels:false,
        unselectedFontSize: 14,
        unselectedItemColor: Colors.white70,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.location_pin),label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.movie),label: 'Stories'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
        ],
      ),
    );
  }
}


// class Navbar extends StatelessWidget {
//   const Navbar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Row(
//           children: [
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.all(10.0),
//                 height: 60.0,
//                 decoration: BoxDecoration(
//                   color: Colors.blue[500],
//                   border: Border.all(color: Colors.black),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'Home',
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 2.0,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.all(10.0),
//                 height: 60.0,
//                 decoration: BoxDecoration(
//                   color: Colors.blue[500],
//                   border: Border.all(color: Colors.black),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'Map',
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 2.0,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.all(10.0),
//                 height: 60.0,
//                 decoration: BoxDecoration(
//                   color: Colors.blue[500],
//                   border: Border.all(color: Colors.black),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'Stories',
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 2.0,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.all(10.0),
//                 height: 60.0,
//                 decoration: BoxDecoration(
//                   color: Colors.blue[500],
//                   border: Border.all(color: Colors.black),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'Profile',
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 2.0,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         )
//     );
//   }
// }