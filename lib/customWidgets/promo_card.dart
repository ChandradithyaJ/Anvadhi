import 'package:flutter/material.dart';

<<<<<<< Updated upstream
Widget promoCard(image, text, progress_percent) {
  return AspectRatio(
    aspectRatio: 2.8 / 3,
    child: Container(
=======
Widget promoCard(String? image, String? text, double? progress_percent) {
 if (image == null) {
    image = 'lib/assets/images/placeholder.png';
  }
 if (text == null) {
    text = 'placeholder';
  }
  if (progress_percent == null) {
    progress_percent = 0.1;
  }

  return AspectRatio(
    aspectRatio: 2.62 / 3,
    child: Container(
      clipBehavior: Clip.hardEdge,
>>>>>>> Stashed changes
      margin: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
<<<<<<< Updated upstream
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
=======
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
>>>>>>> Stashed changes
            ),
            SizedBox(
              height: 10,
            ),
<<<<<<< Updated upstream
          ),
          SizedBox(
            height: 80,
          ),

          Container(
            
            child: LinearProgressIndicator(
              value: progress_percent,
              backgroundColor: Colors.black,
=======
            Container(
              child: LinearProgressIndicator(
                value: progress_percent,
                backgroundColor: Colors.black,
              ),
>>>>>>> Stashed changes
            ),
          ],
        ),
      ),
    ),
  );
}