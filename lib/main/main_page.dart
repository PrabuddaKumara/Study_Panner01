import 'package:c01/main/assiment-page.dart';
import 'package:c01/main/course-page.dart';
import 'package:c01/main/home_page.dart';
import 'package:c01/utils/colors.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedinedex = 0;
  //static List<Widget> _pages = [MainPage(), CoursePage(), AssimentPage()];
  final List<Widget> _pages = [HomePage(), CoursePage(), AssimentPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: greenPrimarycolor,
        unselectedItemColor: greenNormalcolor,
        backgroundColor:bottomNavigationbarcolor,
        currentIndex: _selectedinedex,
        onTap: (index) {
          setState(() {
            _selectedinedex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Course"),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: "Assiment",
          ),
        ],
      ),

      body: _pages[_selectedinedex],
    );
  }
}
