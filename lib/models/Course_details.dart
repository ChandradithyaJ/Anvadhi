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