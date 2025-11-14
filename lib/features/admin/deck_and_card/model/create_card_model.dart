// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

//POST MODEL
class CreateCardModel {
  final String name;
  final String title;
  final String description;
  final File image;
  final String visibility;
  final bool isActive;
  CreateCardModel({
    required this.name,
    required this.title,
    required this.description,
    required this.image,
    required this.visibility,
    required this.isActive,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'title': title,
      'description': description,
      'image': image,
      'visibility': visibility,
      'isActive': isActive,
    };
  }
}