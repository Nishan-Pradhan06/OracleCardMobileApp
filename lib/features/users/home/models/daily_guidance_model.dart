import 'dart:convert';

class DailyGuidanceModel {
  final int id;
  final String title;
  final String message;
  final String? audioUrl;
  final bool hasAudio;
  final String visibility;
  final DateTime scheduledAt;

  DailyGuidanceModel({
    required this.id,
    required this.title,
    required this.message,
    this.audioUrl,
    required this.hasAudio,
    required this.visibility,
    required this.scheduledAt,
  });

  factory DailyGuidanceModel.fromMap(Map<String, dynamic> map) {
    return DailyGuidanceModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      message: map['message'] ?? '',
      audioUrl: map['audioUrl'],
      hasAudio: map['hasAudio'] ?? false,
      visibility: map['visibility'] ?? '',
      scheduledAt:
          DateTime.tryParse(map['scheduledAt'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'audioUrl': audioUrl,
      'hasAudio': hasAudio,
      'visibility': visibility,
      'scheduledAt': scheduledAt.toIso8601String(),
    };
  }

  factory DailyGuidanceModel.fromJson(String source) =>
      DailyGuidanceModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
