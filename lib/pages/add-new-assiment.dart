import 'package:c01/models/add-course-model.dart';
import 'package:c01/widgets/button_widget.dart';
import 'package:c01/widgets/custom-input.dart';
import 'package:flutter/material.dart';

class AddNewAssiment extends StatelessWidget {
  final _forkey = GlobalKey<FormState>();

  final TextEditingController _assimentNameController = TextEditingController();
  final TextEditingController _assimentDescriptionController =
      TextEditingController();
  final TextEditingController _assimentDuractionController =
      TextEditingController();

  final CourseModel course;
  //submit form

  void _subminform(BuildContext context) async {
    if (_forkey.currentState!.validate() ?? false) {}
  }

  AddNewAssiment({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Form(
            key: _forkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add New Assiment"),
                CustomInput(
                  controllered: _assimentNameController,
                  textName: "Assimnet Name",
                  validetor: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please Error Name";
                    }
                    return null;
                  },
                ),
                CustomInput(
                  controllered: _assimentNameController,
                  textName: "Assimnet Description",
                  validetor: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please Error Description";
                    }
                    return null;
                  },
                ),
                CustomInput(
                  controllered: _assimentNameController,
                  textName: "Assimnet Duraction",
                  validetor: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please Error Duraction";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Divider(thickness: 5.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonWidget(
                    textName: "Add Assiment",
                    onpresed: ()=>_subminform(context),
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
