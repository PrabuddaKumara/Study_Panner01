import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String textName;
  final VoidCallback onpresed;

  const ButtonWidget({
    super.key,
    required this.textName,
    required this.onpresed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpresed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        backgroundColor: Colors.green,
      ),
      child: Text(textName),
    );
  }
}
