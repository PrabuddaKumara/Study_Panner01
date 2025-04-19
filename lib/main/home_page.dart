import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Study Planner"),
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push("/add-new-course");
                    },
                    child: Row(children: [Icon(Icons.add), Text("Add Course")]),
                  ),
                ],
              ),
              Text("Course"),
            ],
          ),
        ),
      ),
    );
  }
}
