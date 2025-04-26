import 'dart:io';

import 'package:c01/models/add-course-model.dart';
import 'package:c01/models/nore_model.dart';
import 'package:c01/services/note_services.dart';
import 'package:c01/widgets/button_widget.dart';
import 'package:c01/widgets/custom-input.dart';
import 'package:c01/widgets/services/font-style-services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewNotes extends StatefulWidget {
  final CourseModel course;

  const AddNewNotes({super.key, required this.course});

  @override
  State<AddNewNotes> createState() => _AddNewNotesState();
}

class _AddNewNotesState extends State<AddNewNotes> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _nameTitleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _sectionNameController = TextEditingController();

  final TextEditingController _referencesBookController = TextEditingController();

  final ImagePicker _imagepicker = ImagePicker();

  XFile? _selectImage;

  //method to pickImage from gallery
  Future<void> _pickImage() async {
    final XFile? image = await _imagepicker.pickImage(
      source: ImageSource.gallery,
    );
    await _imagepicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectImage = image;
    });
  }

  void _submitform(BuildContext context) async {
    if (_formkey.currentState?.validate() ?? false) {
      try {
        noteModel note = noteModel(
          id: '',
          title: _nameTitleController.text,
          description: _descriptionController.text,
          section: _sectionNameController.text,
          references: _referencesBookController.text,
          imageData: _selectImage != null ? File(_selectImage!.path) : null,
        );

        // Create the note
        await NoteServices().createNote(
          widget.course.id,
          note,
        );

        // Show success SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Note added successfully!'),
            duration: Duration(
              seconds: 1,
            ),
          ),
        );
      } catch (error) {
        // Consider showing an error SnackBar here
        print("Error adding note: $error");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to add note. Please try again.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formkey,
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
                  validetor: (values) {
                    if (values?.isEmpty ?? true) {
                      return "Please Enter the Name Title";
                    }
                    return null;
                  },
                ),
                CustomInput(
                  controllered: _descriptionController,
                  textName: "Description",
                  validetor: (values) {
                    if (values?.isEmpty ?? true) {
                      return "Please Enter the Description";
                    }
                    return null;
                  },
                ),
                CustomInput(
                  controllered: _sectionNameController,
                  textName: "Section Name",
                  validetor: (values) {
                    if (values?.isEmpty ?? true) {
                      return "Please Enter the Section Name";
                    }
                    return null;
                  },
                ),
                CustomInput(
                  controllered: _referencesBookController,
                  textName: "References Book",
                  validetor: (values) {
                    if (values?.isEmpty ?? true) {
                      return "Please Enter the References book";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Divider(),
                Text(
                  "Developing principled methods to identify diverse and downstream tasks, ut compromising performance.",
                ),
                SizedBox(height: 10),
                ButtonWidget(
                  textName: "Uploard Name Image",
                  onpresed: () => _pickImage(),
                ),
                SizedBox(height: 10),
                _selectImage != null
                    ? Column(
                        children: [
                          Text("Selected Image"),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              File(_selectImage!.path),
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      )
                    : Text("No Image Selecteded"),
                SizedBox(height: 10),
                ButtonWidget(
                  textName: "Submit Note",
                  onpresed: () => _submitform(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}