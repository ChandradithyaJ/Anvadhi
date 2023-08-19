// full_screen_image_page.dart

import 'package:flutter/material.dart';

class FullScreenImagePage extends StatelessWidget {
  final List<String> imageUrls;
  final int initialPageIndex;
  // final String title;
  // final String description;
  // final String loc;

  FullScreenImagePage({
    required this.imageUrls,
    required this.initialPageIndex,
    // required this.title,
    // required this.description,
    // required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: imageUrls.length,
        controller: PageController(initialPage: initialPageIndex),
        itemBuilder: (context, index) {
        
          return Center(
            child: Column(
              children: [
              
                Image.network(
                  imageUrls[index],
                
                  fit: BoxFit.cover,
                ),

                 SizedBox(height: 50),
                Text(
                  "Title: ",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 50),
                Text(
                  "description",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 50),
                Text(
                  "loc",
                  style: TextStyle(fontSize: 20),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
