import 'package:c01/models/add-course-model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseServises {
  final CollectionReference coursecollectio = FirebaseFirestore.instance
      .collection("cousersdf");

      //add new course

      Future<void>createNewCourse(CourseModel course)async{
        try {
          //conver the courseModel object to map

          final Map<String,dynamic>data=course.toJson();

          //add the course colllection

          await coursecollectio.add(data);
          
        } catch (error) {
          print("Error creating course $course");
          
        } 
      }




      
}
