import 'dart:convert';

class CreateSessionModel {
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final String timezone;
  final String zoomUrl;
  final bool isPremiumOnly;

  CreateSessionModel({
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.timezone,
    required this.zoomUrl,
    required this.isPremiumOnly,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'timezone': timezone,
      'zoomUrl': zoomUrl,
      'isPremiumOnly': isPremiumOnly,
    };
  }

  factory CreateSessionModel.fromMap(Map<String, dynamic> map) {
    return CreateSessionModel(
      title: map['title'] as String,
      description: map['description'] as String,
      startTime: DateTime.parse(map['startTime'] as String),
      endTime: DateTime.parse(map['endTime'] as String),
      timezone: map['timezone'] as String,
      zoomUrl: map['zoomUrl'] as String,
      isPremiumOnly: map['isPremiumOnly'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateSessionModel.fromJson(String source) =>
      CreateSessionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
