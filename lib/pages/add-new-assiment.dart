import 'package:c01/models/add-course-model.dart';
import 'package:c01/widgets/button_widget.dart';
import 'package:c01/widgets/custom-input.dart';
import 'package:c01/widgets/services/font-style-services.dart';
import 'package:flutter/material.dart';

class AddNewAssiment extends StatelessWidget {
  final CourseModel course;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _assimentNameController = TextEditingController();
  final TextEditingController _assimentDescriptionController =
      TextEditingController();
  final TextEditingController _assimentDuractionController =
      TextEditingController();
  final ValueNotifier<DateTime> _selectDate = ValueNotifier<DateTime>(
    DateTime.now(),
  );
  final ValueNotifier<TimeOfDay> _selectTime = ValueNotifier<TimeOfDay>(
    TimeOfDay.now(),
  );

  AddNewAssiment({super.key, required this.course}) {
    _selectDate.value = DateTime.now();
    _selectTime.value = TimeOfDay.now();
  }

  //Date Picker

  Future<void> _selecteddate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(2026),
      initialDate: _selectDate.value,
    );
    if (picked != null && picked != _selectDate.value) {
      _selectDate.value = picked;
    }
  }
  //Time Picker

  Future<void> _selectedTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectTime.value,
    );
    if (picked != null && picked != _selectTime.value) {
      _selectTime.value = picked;
    }
  }

  void _submitform(BuildContext context) async {
    if (_formkey.currentState!.validate() ?? false) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),

        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add New Assiment",style: AppWidgets.HeadLineStyle(),),
                SizedBox(height: 20),
                Text(
                  "The overall goal of this workshop is to bring researchers, academicians,  that make the best of the limited data in the medical domain",
                ),
                SizedBox(height: 20),
                CustomInput(
                  controllered: _assimentNameController,
                  textName: "Assiment Name",
                  validetor: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please Enter  the Name";
                    }
                    return null;
                  },
                ),
                CustomInput(
                  controllered: _assimentDescriptionController,
                  textName: "Assiment Description",
                  validetor: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please Enter  the Description";
                    }
                    return null;
                  },
                ),
                CustomInput(
                  controllered: _assimentDuractionController,
                  textName: "Assiment Duraction",
                  validetor: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please Enter  the Description";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 20),
                Text("Due Date and Time"),
                SizedBox(height: 5),
                ValueListenableBuilder<DateTime>(
                  valueListenable: _selectDate,
                  builder: (context, data, child) {
                    return Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Date : ${data.toLocal().toString().split(" ")[0]}",
                          ),
                        ),
                        IconButton(
                          onPressed: () => _selecteddate(context),
                          icon: Icon(Icons.calendar_today),
                        ),
                      ],
                    );
                  },
                ),
                ValueListenableBuilder<TimeOfDay>(
                  valueListenable: _selectTime,
                  builder: (context, time, child) {
                    return Row(
                      children: [
                        Expanded(child: Text("Time : ${time.format(context)}")),
                        IconButton(
                          onPressed: () => _selectedTime(context),
                          icon: Icon(Icons.access_time),
                        ),
                      ],
                    );
                  },
                ),
                ButtonWidget(
                  textName: "Add Assiment",
                  onpresed: () => _submitform(context),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
