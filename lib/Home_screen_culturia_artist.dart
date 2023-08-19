import 'package:flutter/material.dart';
import "package:anvadhi/customWidgets/promo_card.dart";

class Home_screen_culturia_artist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.symmetric(),
                  height: 5,
                  child: Column(
                    children: <Widget>[
                      promoCard('lib/assets/images/image.jpg', "Mannu ki bandi", 1),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.media_bluetooth_off),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "ART...TITS",
                      style: TextStyle(color: Colors.black87, fontSize: 40),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "details ............................................................................................",
                  style: TextStyle(color: Colors.black87, fontSize: 10),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: ElevatedButton(
                        child: Text('Elevated2 Button'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                          onPrimary: Colors.white,
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontStyle: FontStyle.normal),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                          shadowColor: Colors.lightBlue,
                        ),
                        onPressed: () => Navigator.pop(context)
                        // Navigator.of(context)
                        // .push(MaterialPageRoute(builder: (context) => Home_screen_culturia_artist())),
                        ),
                  ),
                ),
              ),
              SizedBox(
                height:20
              ),
            ],
          ),
        ));
  }
}
