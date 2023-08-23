import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:anvadhi/library/User.dart' as currentUser;
import 'package:firebase_storage/firebase_storage.dart';

class ArtDetails extends StatefulWidget {
  Map<String, dynamic> artForm = {};

  ArtDetails({required this.artForm}) : super();

  @override
  State<ArtDetails> createState() => _ArtDetailsState();
}

class _ArtDetailsState extends State<ArtDetails> {
  Future<Widget> _getImage(BuildContext context, String image) async {
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child(image);
    final downloadUrl = await ref.getDownloadURL();
    return Image.network(
      downloadUrl,
      fit: BoxFit.scaleDown,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool bookmarkChanged = false;

    if (widget.artForm.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.purple[50],
        body: const Center(
          child: Text(
            "No art form to display. Please check your internet connection or reload the page.",
            style: TextStyle(
              color: Colors.deepPurpleAccent,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Text(widget.artForm['artName']),
        backgroundColor: Colors.purple[500],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: FutureBuilder(
                    future: _getImage(context, widget.artForm['image']),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          height: MediaQuery.of(context).size.height / 1.25,
                          width: MediaQuery.of(context).size.width / 1.25,
                          child: snapshot.data,
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Container(
                          height: MediaQuery.of(context).size.height / 1.25,
                          width: MediaQuery.of(context).size.width / 1.25,
                          child: const CircularProgressIndicator(),
                        );
                      } else {
                        // CircularProgressIndicator();
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.artForm['description'],
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Location: ${widget.artForm['location']}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Artist(s): ${widget.artForm['artistName']}',
                style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!currentUser.bookmarks
                    .contains(widget.artForm['artName'])) ...[
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        String uid = FirebaseAuth.instance.currentUser!.uid;
                        if (!currentUser.bookmarks
                            .contains(widget.artForm['artName'])) {
                          currentUser.bookmarks.add(widget.artForm['artName']);
                        }
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(uid)
                            .update({'bookmarks': currentUser.bookmarks});
                        setState(() {
                          bookmarkChanged = !bookmarkChanged;
                        });
                      } catch (err) {
                        print('Error adding bookmark: $err');
                      }
                    },
                    child: const Icon(Icons.bookmark_add_outlined),
                  ),
                ] else ...[
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        String uid = FirebaseAuth.instance.currentUser!.uid;
                        if (currentUser.bookmarks
                            .contains(widget.artForm['artName']))
                          currentUser.bookmarks
                              .remove(widget.artForm['artName']);
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(uid)
                            .update({'bookmarks': currentUser.bookmarks});
                        setState(() {
                          bookmarkChanged = !bookmarkChanged;
                        });
                      } catch (err) {
                        print('Error deleting bookmark: $err');
                      }
                    },
                    child: const Icon(Icons.remove_circle),
                  )
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
