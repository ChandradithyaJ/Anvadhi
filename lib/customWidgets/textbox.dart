/// Textbox for the Share your art form page

import 'package:flutter/material.dart';

Widget textbox( hintText,  icon , color ) {
  return Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: Colors.grey, borderRadius: BorderRadius.circular(15)),
    child: TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: Colors.black87,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: color, fontSize: 20)),
    ),
  );
}
