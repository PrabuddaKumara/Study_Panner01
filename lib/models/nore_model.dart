import 'dart:io';

class noteModel{
  final String id;
  final String title;
  final String description;
  final String section;
  final String references;
  final File? imageData;
  final String? imageUrl;

  noteModel({
     required this.id,
    required this.title,
    required this.description,
    required this.section,
    required this.references,
    this.imageData,
    this.imageUrl,
  });

  //convert the note instance the Map
   Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'section': section,
      'references': references,
      'imageData': imageData,
      'imageUrl': imageUrl,
    };
  }
   // Convert a Map into a Note instance
  factory noteModel.fromJson(Map<String, dynamic> json) {
    return noteModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      section: json['section'] ?? '',
      references: json['references'] ?? '',
      imageData: json['imageData'],
      imageUrl: json['imageUrl'],
    );
  }
  
}