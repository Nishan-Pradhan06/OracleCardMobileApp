
/// Individual guidance item
class GuidanceArchiveModel {
  final int id;
  final String title;
  final String message;
  final bool hasAudio;
  final String? audioUrl;
  final Visibility visibility;
  final DateTime? scheduledAt;

  GuidanceArchiveModel({
    required this.id,
    required this.title,
    required this.message,
    required this.hasAudio,
    this.audioUrl,
    required this.visibility,
    this.scheduledAt,
  });

  factory GuidanceArchiveModel.fromJson(Map<String, dynamic> json) {
    return GuidanceArchiveModel(
      id: json['id'] is int ? json['id'] as int : int.parse('${json['id']}'),
      title: json['title'] as String? ?? '',
      message: json['message'] as String? ?? '',
      hasAudio: json['hasAudio'] as bool? ?? false,
      audioUrl: json['audioUrl'] as String?,
      visibility: _visibilityFromString(json['visibility'] as String?),
      scheduledAt: json['scheduledAt'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'message': message,
    'hasAudio': hasAudio,
    'audioUrl': audioUrl,
    'visibility': visibility,
    'scheduledAt': scheduledAt?.toUtc().toIso8601String(),
  };

  GuidanceArchiveModel copyWith({
    int? id,
    String? title,
    String? message,
    bool? hasAudio,
    String? audioUrl,
    Visibility? visibility,
    DateTime? scheduledAt,
  }) {
    return GuidanceArchiveModel(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      hasAudio: hasAudio ?? this.hasAudio,
      audioUrl: audioUrl ?? this.audioUrl,
      visibility: visibility ?? this.visibility,
      scheduledAt: scheduledAt ?? this.scheduledAt,
    );
  }

  @override
  String toString() =>
      'GuidanceItem(id: $id, title: $title, hasAudio: $hasAudio, visibility: $visibility, scheduledAt: $scheduledAt)';
}

/// Visibility enum (expand if you have more visibility values)
enum Visibility { FREE, PAID, UNKNOWN }

Visibility _visibilityFromString(String? value) {
  if (value == null) return Visibility.UNKNOWN;
  switch (value.toUpperCase()) {
    case 'FREE':
      return Visibility.FREE;
    case 'PAID':
      return Visibility.PAID;
    default:
      return Visibility.UNKNOWN;
  }
}