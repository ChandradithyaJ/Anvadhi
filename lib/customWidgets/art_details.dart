import 'package:flutter/material.dart';
import '../services/firestore_images.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:anvadhi/User.dart' as currentUser;

class ArtDetails extends StatelessWidget {
  Map<String, dynamic> artForm = {};

  ArtDetails({ required this.artForm }) : super();

  @override
  Widget build(BuildContext context) {

    if(artForm.isEmpty){
      return const Scaffold(
        body: Center(
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
      appBar: AppBar(
        title: Text(artForm['artName']),
        backgroundColor: Colors.grey,
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
                    child: LoadFirebaseStorageImage(
                        image: artForm['image'],
                      ),
                  ),
                ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                artForm['description'],
                style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Location: ${artForm['location']}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Artist(s): ${artForm['artistName']}',
                style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    try{
                      String uid = FirebaseAuth.instance.currentUser!.uid;
                      if(!currentUser.bookmarks.contains(artForm['artName'])) currentUser.bookmarks.add(artForm['artName']);
                      await FirebaseFirestore.instance.collection('users').doc(uid).update({
                        'bookmarks': currentUser.bookmarks
                      });
                    } catch (err) {
                      print('Error adding bookmark: $err');
                    }
                  },
                  child: const Icon(
                      Icons.bookmark_add_outlined
                  ),
                ),
                const SizedBox(width: 30.0,),
                ElevatedButton(
                  onPressed: () async {
                    try{
                      String uid = FirebaseAuth.instance.currentUser!.uid;
                      if(currentUser.bookmarks.contains(artForm['artName']))currentUser.bookmarks.remove(artForm['artName']);
                      await FirebaseFirestore.instance.collection('users').doc(uid).update({
                        'bookmarks': currentUser.bookmarks
                      });
                    } catch (err) {
                      print('Error deleting bookmark: $err');
                    }
                  },
                  child: const Icon(
                      Icons.remove_circle
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
