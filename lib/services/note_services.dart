import 'package:c01/models/nore_model.dart';
import 'package:c01/services/cloud-storage/store-image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteServices {
  final CollectionReference courseCollection = FirebaseFirestore.instance
      .collection("course");
  Future<void> createNote(String courseId, noteModel note) async {
   try {
      // Store the image in Firebase Storage if it exists
      String? imageUrl;
      if (note.imageData != null) {
        imageUrl = await StorageService()
            .uploadImage(noteImage: note.imageData, courseId: courseId);
      }

      // Create a new note object
      final Map<String, dynamic> data = {
        'title': note.title,
        'description': note.description,
        'section': note.section,
        'references': note.references,
        'imageUrl': imageUrl,
      };

      // Add the note to the collection
      final docRef =
          await courseCollection.doc(courseId).collection('notes').add(data);
      await docRef.update({'id': docRef.id});
    } catch (error) {
      print(error);
    }
  }

  }

