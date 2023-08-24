/// Report page

import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  @override
  ReportPageState createState() => ReportPageState();
}

class ReportPageState extends State<ReportPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController descController = TextEditingController();

  void _sendToDatabase() {
    String name = nameController.text;
    String email = emailController.text;
    String desc = descController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Your Name",
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Your Email or Phone Number",
                  labelText: "Email or Phone Number",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: descController,
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: "Tell us more about your query...",
                  labelText: "Description",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _sendToDatabase,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan[600],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 20.0,
                  ),
                ),
                child: const Text(
                  "Send",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
