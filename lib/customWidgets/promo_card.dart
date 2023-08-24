/// Promo card for the Learn page

import 'package:flutter/material.dart';

Widget promoCard(image, text, progress_percent) {
  return AspectRatio(
    aspectRatio: 2.62 / 3,
    child: Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
              height: 10,
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
    ),
  );
}
