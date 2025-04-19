import 'package:c01/services/add-course-servise.dart';
import 'package:c01/utils/colors.dart';
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
              SizedBox(height: 20),

              Text(
                'Courses',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                'Your running subjects',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              StreamBuilder(
                stream: CourseServises().course,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error : ${snapshot.error}"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 5,
                        ),
                        child: Column(
                          children: [Image.asset("assets/course.png")],
                        ),
                      ),
                    );
                  } else {
                    final cour = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cour.length,
                      itemBuilder: (context, index) {
                        final course = cour[index];
                        return Card(
                          elevation: 0,
                          color: greenPrimarycolor,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(
                              course.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,

                              ),
                            ),
                            subtitle: Text(
                              course.description,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                
                              ),
                            ),
                            




                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
