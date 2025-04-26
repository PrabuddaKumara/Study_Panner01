import 'package:c01/models/add-course-model.dart';
import 'package:c01/services/database/add-course-servise.dart';
import 'package:c01/utils/snapshot_function.dart';
import 'package:c01/widgets/button_widget.dart';
import 'package:c01/widgets/custom-input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddNewCourse extends StatelessWidget {
  final _forkey = GlobalKey<FormState>();

  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _courseDescriptionController =
      TextEditingController();
  final TextEditingController _courseDurationController =
      TextEditingController();
  final TextEditingController _coursesheduleController =
      TextEditingController();
  final TextEditingController _coursesderationController =
      TextEditingController();
  final TextEditingController _courseinputController = TextEditingController();

  void _submitform(BuildContext context) async {
    if (_forkey.currentState?.validate() ?? false) {
      _forkey.currentState?.save();
      try {
        final CourseModel course = CourseModel(
          id: "",
          name: _courseNameController.text,
          description: _courseDescriptionController.text,
          duration: _courseDurationController.text,
          schedule: _coursesheduleController.text,
          instructor: _courseinputController.text,
        );
        await CourseServises().createNewCourse(course);

        if (context.mounted) {
          showSnackBar(
            context: context,
            text: "Courseed Added Succesfully!!!!",
          );
        }

        GoRouter.of(context).go("/");
      } catch (error) {
        if (context.mounted) {
          showSnackBar(context: context, text: "Courseed Added Faild!!!!");
        }
        GoRouter.of(context).go("/");

        print("Error services $error");
      }
    }
  }

  AddNewCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Course")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _forkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInput(
                  controllered: _courseNameController,
                  textName: "Course Name",
            
                  validetor: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please Enter the couse name";
                    }
                    return null;
                  },
                ),
                CustomInput(
                  controllered: _courseDescriptionController,
                  validetor: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please Enter the Descrtipion";
                    }
                    return null;
                  },
                  textName: "Course Description",
                ),
                CustomInput(
                  controllered: _courseDurationController,
                  validetor: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please Enter the Duration";
                    }
                    return null;
                  },
                  textName: "Course Duration",
                ),
                CustomInput(
                  controllered: _coursesheduleController,
                  validetor: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please Enter the Shedule";
                    }
                    return null;
                  },
                  textName: "Course Shedule",
                ),
            
                CustomInput(
                  controllered: _coursesderationController,
                  validetor: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please Enter the Decaration";
                    }
                    return null;
                  },
                  textName: "Course Decaration",
                ),
                CustomInput(
                  controllered: _courseinputController,
                  validetor: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please Enter the Input";
                    }
                    return null;
                  },
                  textName: "Course Input",
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  
                  child: ButtonWidget(
                    textName: "Add course",
                    onpresed: () => _submitform(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
