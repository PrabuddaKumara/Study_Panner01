import 'package:c01/models/add-course-model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseServises {
  final CollectionReference courseCollection = FirebaseFirestore.instance
      .collection("course");

  //add new course

  Future<void> createNewCourse(CourseModel course) async {
    try {
      final Map<String, dynamic> data = course.toJson();
      final DocumentReference docfr = await courseCollection.add(data);
      await docfr.update({'id':docfr.id});

      //delay navigation to ensure Snackbar is display

      await Future.delayed(Duration(seconds: 2));
    } catch (error) {
      print("Faild the error $error");
    }
  }

  //get all courses as list  of course

  Stream <List<CourseModel>>get course{
    try {
      return courseCollection.snapshots().map(
        (snapshot){
          return snapshot.docs.map((doc)=>CourseModel.fromJson(doc.data()as Map<String,dynamic>)).toList();
        }
      );
      
    } catch (error) {
      print("Fild document $error");
      return  Stream.empty();
      
    }
  }

  // Stream <List<CourseModel>>get cou{
  //   try {
      
  //   } catch (e) {
  //     print(object)
      
  //   }
  // }



}
