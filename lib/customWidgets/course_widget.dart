import 'package:flutter/material.dart';

class Course {
  final String courseId;
  final String courseName;
  final String description;
  final List<String> images;
  final List<String> instructors;
  final String location;

  Course({
    required this.courseId,
    required this.courseName,
    required this.description,
    required this.images,
    required this.instructors,
    required this.location,
  });
}
class CourseWidget extends StatelessWidget {
  final Course course;

  const CourseWidget({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.courseName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Do something
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // Image slider
          Container(
            height: MediaQuery.of(context).size.height * 0.4, // 40% of device height
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: course.images.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.network(course.images[index]),
                    ),
                  );
                },
              ),
            ),
          ),

          // Description, instructor, location
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text(course.description),
                SizedBox(height: 16),
                Text(
                  'Instructor:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(course.instructors.join(", ")),
                const SizedBox(height: 16),
                Text(
                  'Location:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(course.location),
              ],
            ),
          ),

          // My Progress button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle my progress button click
              },
              child: Text('My Progress'),
            ),
          ),
        ],
      ),
    );
  }
}
