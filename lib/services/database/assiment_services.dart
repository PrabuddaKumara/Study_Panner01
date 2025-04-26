import 'package:c01/models/assiment_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AssimentServices {
  final CollectionReference courseCollection = FirebaseFirestore.instance
      .collection("course");
  //create new assiment into course
  Future<void> createAssiment(String courseId, AssimentModel assiment) async {
    try {
      final Map<String, dynamic> data = assiment.toJson();

      //assimrnt collection ref
      final CollectionReference assimentCollection = courseCollection
          .doc(courseId)
          .collection("assiment");

      DocumentReference docref = await assimentCollection.add(data);

      //update ths assiment id with document id

      await docref.update({'id': docref.id});

      //update the
    } catch (error) {
      print(error);
    }
  }
}
