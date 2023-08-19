import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:anvadhi/customWidgets/promo_card.dart';


class LiquidDropTrying extends StatelessWidget {
 Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 2));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.deepPurple[100],
         body: LiquidPullToRefresh( onRefresh: _refresh,
        springAnimationDurationInMilliseconds: 100,
         color: Colors.deepPurple,
          backgroundColor: Colors.deepPurple[100],
          height: 300.0,
          animSpeedFactor: 2,
          showChildOpacityTransition: true,



           child: ListView(
             children: [
               Padding(
                 padding: const EdgeInsets.all(25.0),
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(20),
                   child: Container(
                     height: 200,
                     width: 200,
                     color: Colors.deepPurple[200],
                   ),
                 ),
               ),
                Padding(
                 padding: const EdgeInsets.all(25.0),
                 child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                   child: Container(
                     height: 200,
                     width: 200,
                      color: Colors.deepPurple[200],
                   ),
                 ),
               ),
                Padding(
                 padding: const EdgeInsets.all(25.0),
                 child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                   child: Container(
                     height: 200,
                     width: 200,
                      color: Colors.deepPurple[200],
                   ),
                 ),
               ),
                Padding(
                 padding: const EdgeInsets.all(25.0),
                 child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                   child: Container(
                     height: 200,
                     width: 200,
                      color: Colors.deepPurple[200],
                   ),
                 ),
               )
             ],
           ),
         ),
        
    
    );
  }
}