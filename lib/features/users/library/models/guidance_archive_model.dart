

class GuidanceArchiveData {
  final List<GuidanceArchiveItem> items;
  final int? nextCursor;

  GuidanceArchiveData({required this.items, this.nextCursor});

  factory GuidanceArchiveData.fromJson(Map<String, dynamic> json) {
    return GuidanceArchiveData(
      items: (json['items'] as List)
          .map((item) => GuidanceArchiveItem.fromJson(item))
          .toList(),
      nextCursor: json['nextCursor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
      'nextCursor': nextCursor,
    };
  }
}

class GuidanceArchiveItem {
  final int id;
  final String title;
  final String message;
  final bool hasAudio;
  final String? audioUrl;
  final String visibility;
  final DateTime scheduledAt;

  GuidanceArchiveItem({
    required this.id,
    required this.title,
    required this.message,
    required this.hasAudio,
    this.audioUrl,
    required this.visibility,
    required this.scheduledAt,
  });

  factory GuidanceArchiveItem.fromJson(Map<String, dynamic> json) {
    return GuidanceArchiveItem(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      hasAudio: json['hasAudio'],
      audioUrl: json['audioUrl'],
      visibility: json['visibility'],
      scheduledAt: DateTime.parse(json['scheduledAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'hasAudio': hasAudio,
      'audioUrl': audioUrl,
      'visibility': visibility,
      'scheduledAt': scheduledAt.toIso8601String(),
    };
  }
}
