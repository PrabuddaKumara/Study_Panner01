import 'package:c01/models/add-course-model.dart';
import 'package:flutter/material.dart';

class SingleCourse extends StatelessWidget {
  final CourseModel course;

  const SingleCourse({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                course.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Instructor: ${course.instructor}',
                style: const TextStyle(fontSize: 13, color: Colors.white60),
              ),
              Text(
                'Duration: ${course.duration}',
                style: const TextStyle(fontSize: 13, color: Colors.white60),
              ),
              const SizedBox(height: 5),
              Text(
                'Schedule: ${course.schedule}',
                style: const TextStyle(fontSize: 13, color: Colors.white60),
              ),
              const SizedBox(height: 20),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                course.description,
                style: const TextStyle(fontSize: 13, color: Colors.white60),
              ),
              const SizedBox(height: 10),
              
            ],
          ),
        ),
      ),
    );
  }
}
