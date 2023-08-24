/// Pick a profile pic from the ones given

import 'package:flutter/material.dart';
import 'package:anvadhi/library/User.dart' as currentUser;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Hidden_draw.dart';

class PickProfilePic extends StatefulWidget {
  Map<String, dynamic> selectedArtForm;
  List<Map<String, dynamic>> ArtForms;

  PickProfilePic({required this.ArtForms, required this.selectedArtForm})
      : super();

  @override
  State<PickProfilePic> createState() => _PickProfilePicState();
}

class _PickProfilePicState extends State<PickProfilePic> {
  @override
  Widget build(BuildContext context) {
    List<String> profilepics = [
      'https://newevolutiondesigns.com/images/wallpapers/cool-4k-wallpaper-9.jpg',
      'https://imgs.search.brave.com/otbddk0Y3dateXqMWzum8T3biCXfqGE45FyxpZb2Xms/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9iZXN0/cHJvZmlsZXBpY3R1/cmVzLmNvbS93cC1j/b250ZW50L3VwbG9h/ZHMvMjAyMS8wNC9D/b29sLVBpYy03Nzl4/MTAyNC5qcGc',
      'https://imgs.search.brave.com/_XBoT6A6-hJHfQiiQcQMa_Yo3p3zNG8D2i4isjD3rd4/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2E3Lzk2/L2U5L2E3OTZlOWIx/ZmRkNTE5NDg5NTk5/Y2I3YTIzOGZhNmJj/LmpwZw',
      'https://e1.pxfuel.com/desktop-wallpaper/497/182/desktop-wallpaper-city-anime-girl-alone-anime-alone-girl-thumbnail.jpg',
      'https://e1.pxfuel.com/desktop-wallpaper/207/1021/desktop-wallpaper-yourname-night-anime-sky-illustration-art-android-anime-sky-thumbnail.jpg',
      'https://e0.pxfuel.com/wallpapers/520/288/desktop-wallpaper-samurai-sky-art-thumbnail.jpg',
      'https://i.pinimg.com/474x/fd/c4/ea/fdc4ea89768a65c947634967b72fe845.jpg',
      'https://i.pinimg.com/236x/2f/5d/ce/2f5dce84606a38db3845236528ed3571.jpg',
      'https://i.pinimg.com/236x/ff/2e/a2/ff2ea2726810dd34b711936664becf50.jpg'
    ];

    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: const Text("Pick a profile pic!"),
        backgroundColor: Colors.purpleAccent[100],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40.0,
          ),
          SafeArea(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 500,
                    autoPlay: true,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    scrollDirection: Axis.horizontal,
                    enlargeCenterPage: true,
                    autoPlayInterval: const Duration(seconds: 200),
                  ),
                  itemCount: profilepics.length,
                  itemBuilder: (context, index, realIndex) {
                    return Row(
                      children: <Widget>[
                        Expanded(
                          child: ClipRect(
                            child: Material(
                              color: Colors.transparent,
                              child: Ink.image(
                                image: NetworkImage(profilepics[index]),
                                fit: BoxFit.cover,
                                width: 256,
                                height: 512,
                                child: InkWell(
                                  onTap: () async {
                                    currentUser.defaultImage =
                                        profilepics[index];
                                    await FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(FirebaseAuth
                                            .instance.currentUser?.uid)
                                        .update({
                                      'defaultImage': profilepics[index]
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Hidden_draww(
                                                ArtForms: widget.ArtForms,
                                                selectedArtForm:
                                                widget.selectedArtForm)));
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
