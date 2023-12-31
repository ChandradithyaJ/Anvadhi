/// Home page

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import './Arts_display.dart';
import 'package:anvadhi/library/User.dart' as currentUser;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

// fetching a image from firebase storage
class FireStorageService {
  FireStorageService._();

  static Future<String> loadFromStorage(String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}

class Home_screen_culturia extends StatefulWidget {
  Map<String, dynamic> selectedArtForm;
  List<Map<String, dynamic>> ArtForms;

  Home_screen_culturia({required this.ArtForms, required this.selectedArtForm})
      : super();

  @override
  State<Home_screen_culturia> createState() => _Home_screen_culturiaState();
}

class _Home_screen_culturiaState extends State<Home_screen_culturia> {
  final storage = FirebaseStorage.instance;

  // fetching a image from firebase storage
  Future<Widget> _getImage(BuildContext context, String image) async {
    final ref = storage.ref().child(image);
    final downloadUrl = await ref.getDownloadURL();
    return Image.network(
      downloadUrl,
      fit: BoxFit.scaleDown,
    );
  }

  @override
  Widget build(BuildContext context) {

    // fetch user details if not fetched already
    void getUserDetails() async {
      if (!currentUser.getFirestore) {
        final usersRef = FirebaseFirestore.instance.collection('users');
        List<Map<String, dynamic>> reqUsers = [];
        await usersRef
            .where("uid", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
            .get()
            .then((snapshot) {
          snapshot.docs.forEach((element) {
            reqUsers.add(element.data());
          });
        });
        Map<String, dynamic> reqUser = reqUsers[0];

        currentUser.displayName = reqUser['displayName'];
        currentUser.bookmarks = reqUser['bookmarks'];
        currentUser.defaultImage = reqUser['defaultImage'];
        currentUser.getFirestore = true;
      }
    }

    getUserDetails();

    // store all the images in a list
    List<String> artFormPics =
        widget.ArtForms.map((artForm) => artForm['image'].toString()).toList();
    // get the bookmarked art forms images
    List<String> bookmarked = [];
    for (dynamic artForm in widget.ArtForms) {
      if (currentUser.bookmarks.contains(artForm['artName']))
        bookmarked.add(artForm['image']);
    }

    // carousel sliders to display images are present
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
                padding: const EdgeInsets.fromLTRB(0, 20.0, 0.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Center(
                      child: Text(
                        "Welcome to World of Cultures!",
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.w900
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(25)),
                      child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black87,
                            ),
                            hintText: "Search...",
                            hintStyle:
                                TextStyle(color: Colors.deepPurpleAccent, fontSize: 20)),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(
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
                                autoPlayInterval: const Duration(seconds: 200),
                              ),
                              itemCount: artFormPics.length,
                              itemBuilder: (context, index, realIndex) {
                                return Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: FutureBuilder(
                                        future: _getImage(
                                            context, artFormPics[index]),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
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
                                                  const CircularProgressIndicator(),
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
                            child: const Text('Bookmarked'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple[600],
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontStyle: FontStyle.normal),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              shadowColor: Colors.lightBlue,
                            ),
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => ArtsDisplay(
                                        ArtForms: widget.ArtForms,
                                        selectedArtForm:
                                            widget.selectedArtForm))),
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        child: ListView(
                          children: <Widget>[
                            if (bookmarked.length > 0) ...[
                              CarouselSlider.builder(
                                options: CarouselOptions(
                                  height: 200,
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  autoPlayInterval:
                                      const Duration(seconds: 200),
                                ),
                                itemCount: bookmarked.length,
                                itemBuilder: (context, index, realIndex) {
                                  return Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: FutureBuilder(
                                          future: _getImage(
                                              context, bookmarked[index]),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
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
                                            } else if (snapshot
                                                    .connectionState ==
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
                                                    const CircularProgressIndicator(),
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
                            ] else ...[
                              const Center(
                                child: Text(
                                  "Bookmark an art form to learn now!",
                                  style: TextStyle(color: Colors.deepOrange),
                                ),
                              )
                            ]
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
