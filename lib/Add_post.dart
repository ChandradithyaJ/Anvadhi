import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class Post {
  final String name;
  final String location;
  final String description;
  final String artType;
  final String? imagePath;

  Post({
    required this.name,
    required this.location,
    required this.description,
    required this.artType,
    this.imagePath,
  });
}

class AddpostList extends StatefulWidget {

  List<Map<String, dynamic>> ArtForms;
  AddpostList({ required this.ArtForms }) : super();

  @override
  _AddpostListState createState() => _AddpostListState();
}

class _AddpostListState extends State<AddpostList> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController artTypeController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  final TextEditingController artistNameController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  File _pickedImage = new File ('');
  List<Post> posts = [];

  void _pickImage() async {
    XFile? pickedImage;
    try {
      pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    } catch (err) {
      print('Error getting file: $err');
    }
    File image = File(pickedImage!.path);
    setState(() {
      _pickedImage = image;
    });
  }

  void _sendToDatabase() async {
    String name = nameController.text;
    String location = locationController.text;
    String description = descController.text;
    String artType = artTypeController.text;
    String year = yearController.text;
    String artistName = artistNameController.text;

    Post newPost = Post(
      name: name,
      location: location,
      description: description,
      artType: artType,
      imagePath: _pickedImage.path,
    );

    // update in firestore
    final artFormsRef = FirebaseFirestore.instance.collection('artForms');
    final storage = FirebaseStorage.instance.ref();

    List<Location> locations = await locationFromAddress(location);
    double lat = 0, lng = 0;
    if(locations.isNotEmpty){
      lat = locations[0].latitude;
      lng = locations[0].longitude;
    }

    Map<String, dynamic> createArtFormEntry = {
      'artName': name,
      'artistName': artistName,
      'year': int.tryParse(year),
      'latlong': GeoPoint(lat, lng),
      'description': description,
      'artFormId': widget.ArtForms.length + 1,
      'location': location,
      'image': _pickedImage.path.split("/").last
    };

    try{
      await artFormsRef.doc(name).set(createArtFormEntry, SetOptions(merge: true));
      final imageRef = storage.child("${_pickedImage.path.split("/").last}");
      await imageRef.putFile(_pickedImage);
    } catch (e) {
      print(e);
    }

    setState(() {
      posts.add(newPost);
      _pickedImage = new File('');
    });

    nameController.clear();
    locationController.clear();
    descController.clear();
    artTypeController.clear();

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Add Info of Art Form",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Art Form Name",
                  labelText: "Art Form Name...",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: locationController,
                decoration: const InputDecoration(
                  hintText: "Location",
                  labelText: "Location",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: descController,
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: "Tell us more about your art...",
                  labelText: "Description",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: artTypeController,
                decoration: const InputDecoration(
                  hintText: "Art Type",
                  labelText: "Art Type",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: artistNameController,
                decoration: const InputDecoration(
                  hintText: "Artist Name...",
                  labelText: "Artist Name",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: yearController,
                decoration: const InputDecoration(
                  hintText: "Year in which the art was born...",
                  labelText: "Year of inception",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text("Pick Image"),
                // Image.network(File(_pickedImage!.path).toString()),
              ),
              if (!_pickedImage.existsSync() || _pickedImage.lengthSync() == 0) Image.file(File(_pickedImage.path)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _sendToDatabase,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50.0,
                    vertical: 10.0,
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Post",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: posts.map((post) {
                  return ListTile(
                    title: Text("Name: ${post.name}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Location: ${post.location}"),
                        Text("Art Type: ${post.artType}"),
                        Text("Description: ${post.description}"),
                      ],
                    ),
                    trailing: post.imagePath != null
                        ? Image.file(File(post.imagePath!))
                        : null,
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
