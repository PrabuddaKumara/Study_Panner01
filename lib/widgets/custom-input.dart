import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controllered;
  final String textName;
  final String? Function(String?)? validetor;

  const CustomInput({
    super.key,
    required this.controllered,
    required this.textName,
    this.validetor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: TextFormField(
        controller: controllered,
        validator: validetor,
        decoration: InputDecoration(
          labelText: textName,
          labelStyle: TextStyle(
            color: const Color.fromARGB(255, 99, 150, 10),
            fontSize: 15,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 134, 10, 95),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 13.0,
            horizontal: 13.0,
          ),
        ),
      ),
    );
  }
}
