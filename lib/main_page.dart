import 'package:c01/main/assiment-page.dart';
import 'package:c01/main/course-page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget>_pages=[
    MainPage(),
    CoursePage(),
    AssimentPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blueGrey,
        
        
        items: [
          
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school),label:"Couse"),
          BottomNavigationBarItem(icon: Icon(Icons.assessment),label:"Assiment"),

      ]),

    );
  }
}
