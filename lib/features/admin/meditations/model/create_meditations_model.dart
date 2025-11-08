import 'dart:convert';
import 'dart:io';

class CreateMeditationsModel {
  final String title;
  final String description;
  final File? audioFile;
  final String visibility;
  final bool isDownloadable;

  CreateMeditationsModel({
    required this.title,
    required this.description,
    this.audioFile,
    required this.visibility,
    required this.isDownloadable,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'visibility': visibility,
      'isDownloadable': isDownloadable,
    };
  }

  factory CreateMeditationsModel.fromMap(Map<String, dynamic> map) {
    return CreateMeditationsModel(
      title: map['title'] as String,
      description: map['description'] as String,
      visibility: map['visibility'] as String,
      isDownloadable: map['isDownloadable'] as bool,
    );
  }

  String toJson() => json.encode(toMap());
}
