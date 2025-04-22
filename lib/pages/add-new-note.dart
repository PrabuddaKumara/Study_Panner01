import 'package:c01/models/add-course-model.dart';
import 'package:flutter/material.dart';

class AddNewNotes extends StatelessWidget {
  final CourseModel course;

  const AddNewNotes({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Add New note"),
            
          ],
        ),
      ),
    );
  }
}
