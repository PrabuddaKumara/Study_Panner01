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

  //all the assiment inside the course
  Stream<List<AssimentModel>> getassiment(String courseId) {
    try {
      //assimrnt collection references
      final CollectionReference assimentCollection = courseCollection
          .doc(courseId)
          .collection("assiment");
      return assimentCollection.snapshots().map((snapshot) {
        return snapshot.docs
            .map(
              (doc) =>
                  AssimentModel.fromJson(doc.data() as Map<String, dynamic>),
            )
            .toList();
      });
    } catch (error) {
      print("error assimne");
      return Stream.empty();
    }
  }

  //get all assimnet with the course name
  Future<Map<String, List<AssimentModel>>> getAssimentCourseName() async {
    try {
      final QuerySnapshot snapshot = await courseCollection.get();
      final Map<String, List<AssimentModel>> assimentMap = {};

      for (final doc in snapshot.docs) {
        //current course id
        final String courseId = doc.id;

        //all the assiments inside the course

        final List<AssimentModel> assiments = await getassiment(courseId).first;

        //create a new key value pair with the course name and the list assiment

        assimentMap[doc['name']] = assiments;
      }
      return assimentMap;
    } catch (errror) {
      print("Error");
      return {};
    }
  }
}
