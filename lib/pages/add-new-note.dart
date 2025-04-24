import 'package:c01/models/add-course-model.dart';
import 'package:c01/widgets/button_widget.dart';
import 'package:c01/widgets/custom-input.dart';
import 'package:c01/widgets/services/font-style-services.dart';
import 'package:flutter/material.dart';

class AddNewNotes extends StatelessWidget {
  final CourseModel course;

  final _formkey = GlobalKey<FormState>();
  TextEditingController _nameTitleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _sectionNameController = TextEditingController();
  TextEditingController _referencesBookController = TextEditingController();

  AddNewNotes({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add New note", style: AppWidgets.HeadLineStyle()),
                SizedBox(height: 10),
                Text(
                  "Developing principled methods to identify diverse and downstream tasks, ut compromising performance.",
                ),
                SizedBox(height: 20),

                CustomInput(
                  controllered: _nameTitleController,
                  textName: "Name Title",
                ),
                CustomInput(
                  controllered: _descriptionController,
                  textName: "Description",
                ),
                CustomInput(
                  controllered: _sectionNameController,
                  textName: "Section Name",
                ),
                CustomInput(
                  controllered: _referencesBookController,
                  textName: "References Book",
                ),
                SizedBox(height: 20),
                Divider(),
                Text(
                  "Developing principled methods to identify diverse and downstream tasks, ut compromising performance.",
                ),
                SizedBox(height: 10),
                ButtonWidget(textName: "Uploard Name Image", onpresed: () {}),
                SizedBox(height: 10),

                Text("No Image Selected."),
                SizedBox(height: 10),
                ButtonWidget(textName: "Submit Note", onpresed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
