import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AssimentModel {
  final String id;
  final String name;
  final String description;
  final String duration;
  final DateTime dueDate;
  final TimeOfDay dueTime;

  AssimentModel({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.dueDate,
    required this.dueTime,
  });

  //convert to dart document

  factory AssimentModel.fromJson(Map<String, dynamic> data) {
    return AssimentModel(
      id: data['id'] ?? '',
      name: data['id'] ?? '',
      description: data['id'] ?? '',
      duration: data['id'] ?? '',
      dueDate: (data['dueDate'] as Timestamp).toDate(),
      dueTime: TimeOfDay.fromDateTime(data['dueTime']),
    );
  }
  //dart document conevert json document

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'duration': duration,
      'dueDate': Timestamp.fromDate(dueDate),
      'dueTime': Timestamp.fromDate(
        DateTime(
          dueDate.year,
          dueDate.month,
          dueDate.day,
          dueTime.hour,
          dueTime.minute,
        ),
      ),
    };
  }
}
