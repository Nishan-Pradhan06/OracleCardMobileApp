import 'dart:io';

class AdminDailyGuidanceModel {
  final String title;
  final String message;
  final File audioUrl;
  final String visibility;

  AdminDailyGuidanceModel({
    required this.title,
    required this.message,
    required this.audioUrl,
    required this.visibility,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'message': message,
      'visibility': visibility,
    };
  }
}
