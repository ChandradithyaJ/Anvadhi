import 'package:flutter/material.dart';

Widget ElevatedButtonWidget(Color textcolor, String button_text, double size,BuildContext context, Widget Onclickedwidget) {
  return Container(
    child: Center(
      child: ElevatedButton(
        child: Text(button_text),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey,
          onPrimary: Colors.white,
          textStyle:  TextStyle(
              color: textcolor,
              fontSize: 25,
              fontStyle: FontStyle.normal),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(5))),
          shadowColor: Colors.lightBlue,
        ),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) =>
                  Onclickedwidget
          )
        ),
      ),
    ),
  );
}



