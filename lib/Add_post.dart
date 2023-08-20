import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    home: Addpost(),
  ));
}

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

class Addpost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Post"),
      ),
      body: AddpostList(),
    );
  }
}

class AddpostList extends StatefulWidget {
  @override
  _AddpostListState createState() => _AddpostListState();
}

class _AddpostListState extends State<AddpostList> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController artTypeController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedImage;
  List<Post> posts = [];

  void _pickImage() async {
    XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  void _sendToDatabase() {
    String name = nameController.text;
    String location = locationController.text;
    String description = descController.text;
    String artType = artTypeController.text;

    Post newPost = Post(
      name: name,
      location: location,
      description: description,
      artType: artType,
      imagePath: _pickedImage?.path,
    );

    setState(() {
      posts.add(newPost);
      _pickedImage = null;
    });

    nameController.clear();
    locationController.clear();
    descController.clear();
    artTypeController.clear();
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
              Text(
                "Add Info",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Your Name",
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: locationController,
                decoration: InputDecoration(
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
                decoration: InputDecoration(
                  hintText: "Tell us more about your art...",
                  labelText: "Description",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: artTypeController,
                decoration: InputDecoration(
                  hintText: "Art Type",
                  labelText: "Art Type",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text("Pick Image"),
                // Image.network(File(_pickedImage!.path).toString()),
              ),
              if (_pickedImage != null) Image.file(File(_pickedImage!.path)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _sendToDatabase,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 20.0,
                  ),
                ),
                child: Text(
                  "Post",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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