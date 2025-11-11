// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

class AdminDailyGuidanceModel {
  final String title;
  final String message;
  final File? audioUrl;
  final String visibility;

  AdminDailyGuidanceModel({
    required this.title,
    required this.message,
    this.audioUrl,
    required this.visibility,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'message': message,
      'audioUrl': audioUrl?.path,
      'visibility': visibility,
    };
  }

  factory AdminDailyGuidanceModel.fromMap(Map<String, dynamic> map) {
    return AdminDailyGuidanceModel(
      title: map['title'] as String,
      message: map['message'] as String,
      audioUrl: map['audioUrl'] != null
          ? File(map['audioUrl'] as String)
          : null,
      visibility: map['visibility'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminDailyGuidanceModel.fromJson(String source) =>
      AdminDailyGuidanceModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
