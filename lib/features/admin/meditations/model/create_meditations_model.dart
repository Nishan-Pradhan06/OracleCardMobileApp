import 'dart:io';

import 'package:dio/dio.dart';

class CreateMeditationsModel {
  final String title;
  final String description;
  final File audioFile;
  final String visibility;
  final bool isDownloadable;

  CreateMeditationsModel({
    required this.title,
    required this.description,
 required   this.audioFile,
    required this.visibility,
    required this.isDownloadable,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'audioFile': MultipartFile.fromFile(audioFile.path),
      'visibility': visibility,
      'isDownloadable': isDownloadable,
    };
  }
}
