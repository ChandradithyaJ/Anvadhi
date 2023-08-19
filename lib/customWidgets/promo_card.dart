import 'package:flutter/material.dart';

Widget promoCard(image, text, progress_percent) {
  return AspectRatio(
    aspectRatio: 2.8 / 3,
    child: Container(
      margin: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
            fit: BoxFit.cover, image: AssetImage('assets/images/image.jpg')),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                0.1,
                0.9
              ], colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.1)
              ]),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 80,
          ),

          Container(
            
            child: LinearProgressIndicator(
              value: progress_percent,
              backgroundColor: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}