import 'package:flutter/material.dart';

Widget promoCardBasic(image, text, progress_percent) {
  return AspectRatio(
    aspectRatio: 2.62/3,
    child: Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

            ),

            Container(
              child: Text(
                text,
                textAlign: TextAlign.end,
                style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
  );
}
