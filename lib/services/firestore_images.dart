import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class LoadFirebaseStorageImage extends StatefulWidget {
  String image;
  LoadFirebaseStorageImage({ required this.image }) : super();

  @override
  State<LoadFirebaseStorageImage> createState() => _LoadFirebaseStorageImageState();
}

class _LoadFirebaseStorageImageState extends State<LoadFirebaseStorageImage> {
   bool showImage = false;
   final storage = FirebaseStorage.instance;

   Future<void> getImage() async {
     final ref = storage.ref().child(widget.image);
     final downloadUrl = await ref.getDownloadURL();
     setState(() {
       widget.image = downloadUrl;
     });
   }

   @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.image,
      fit: BoxFit.fill,
    );
  }
}
