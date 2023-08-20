import 'package:anvadhi/fireStoreImages.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:anvadhi/customWidgets/promo_card.dart';
import 'package:anvadhi/customWidgets/promo_card_basic.dart';
import 'package:anvadhi/Arts_display.dart';

//firebase stuff
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class FireStorageService {
  FireStorageService._();

  static Future<String> loadFromStorage(String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}

class Home_screen_culturia extends StatefulWidget {
  @override
  State<Home_screen_culturia> createState() => _Home_screen_culturiaState();
}

class _Home_screen_culturiaState extends State<Home_screen_culturia> {
  final storage = FirebaseStorage.instance;

  Future<Widget> _getImage(BuildContext context, String image) async {
    final ref = storage.ref().child(image);
    final downloadUrl = await ref.getDownloadURL();
    print(downloadUrl);
    return Image.network(
      downloadUrl,
      fit: BoxFit.scaleDown,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "Welcome to World of Cultures!",
                        style: TextStyle(color: Colors.pink, fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15)),
                      child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black87,
                            ),
                            hintText: "Search",
                            hintStyle:
                                TextStyle(color: Colors.pink, fontSize: 20)),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Explore Arts",
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 28),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 200,
                        child: ListView(
                          children: <Widget>[
                            CarouselSlider.builder(
                              options: CarouselOptions(
                                height: 200,
                                scrollDirection: Axis.horizontal,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                autoPlayInterval: Duration(seconds: 200),
                              ),
                              itemCount: 12,
                              itemBuilder: (context, index, realIndex) {
                                return Row(
                                  children: <Widget>[
                                    Expanded(
                                      //     child: promoCardBasic(
                                      //         'lib/assets/images/image.jpg',
                                      //         "kalamkari",
                                      //         0.1)
                                      child: FutureBuilder(
                                        future: _getImage(context,
                                            'Thang-Ta1.jpg'),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            // if (snapshot.hasError) {
                                            //   return SomethingWentWrong();
                                            // }
                                            return Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.25,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.25,
                                              child: snapshot.data,
                                            );
                                          } else if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.25,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.25,
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          } else {
                                            // CircularProgressIndicator();
                                            return Container();
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Center(
                          child: ElevatedButton(
                            child: const Text('Explore Categories'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple[300],
                              onPrimary: Colors.white,
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontStyle: FontStyle.normal),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              shadowColor: Colors.lightBlue,
                            ),
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => ArtsDisplay())),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            promoCard('lib/assets/images/image.jpg',
                                "kalamkari", 0.1),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: const Center(
                            // child: ElevatedButton(
                            // child: Text('Continue  Button'),
                            // style: ElevatedButton.styleFrom(
                            //   primary: Colors.grey,
                            //   onPrimary: Colors.white,
                            //   textStyle: const TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 25,
                            //       fontStyle: FontStyle.normal),
                            //   shape: RoundedRectangleBorder(
                            //       borderRadius: const BorderRadius.all(
                            //           Radius.circular(5))),
                            //   shadowColor: Colors.lightBlue,
                            // ),
                            // onPressed: () => Navigator.of(context).push(
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             Home_screen_culturia())),
                            // ),
                            ),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      )),
    );
  }
}
