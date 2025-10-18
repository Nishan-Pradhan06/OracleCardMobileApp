class Session {
  final String dateTime;
  final String title;
  final String description;
  final bool isButtonEnabled;

  const Session({
    required this.dateTime,
    required this.title,
    required this.description,
    this.isButtonEnabled = false,
  });

  // Factory constructor for JSON parsing (optional)
  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      dateTime: json['dateTime'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      isButtonEnabled: json['isButtonEnabled'] ?? false,
    );
  }

  // Convert to JSON (optional)
  Map<String, dynamic> toJson() {
    return {
      'dateTime': dateTime,
      'title': title,
      'description': description,
      'isButtonEnabled': isButtonEnabled,
    };
  }

  // Copy with new values (optional for immutability)
  Session copyWith({
    String? dateTime,
    String? title,
    String? description,
    bool? isButtonEnabled,
  }) {
    return Session(
      dateTime: dateTime ?? this.dateTime,
      title: title ?? this.title,
      description: description ?? this.description,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
    );
  }
}

class UpcomingSessionsDataModel {
  final List<SessionItemModel> items;

  UpcomingSessionsDataModel({required this.items});

  factory UpcomingSessionsDataModel.fromJson(Map<String, dynamic> json) {
    return UpcomingSessionsDataModel(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => SessionItemModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'items': items.map((e) => e.toJson()).toList()};
  }
}

class SessionItemModel {
  final int id;
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final String timezone;
  final String zoomUrl;
  final bool isPremiumOnly;
  final int createdById;
  final bool rsvp;
  final bool canJoin;

  SessionItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.timezone,
    required this.zoomUrl,
    required this.isPremiumOnly,
    required this.createdById,
    required this.rsvp,
    required this.canJoin,
  });

  factory SessionItemModel.fromJson(Map<String, dynamic> json) {
    return SessionItemModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      startTime: DateTime.tryParse(json['startTime'] ?? '') ?? DateTime.now(),
      endTime: DateTime.tryParse(json['endTime'] ?? '') ?? DateTime.now(),
      timezone: json['timezone'] ?? '',
      zoomUrl: json['zoomUrl'] ?? '',
      isPremiumOnly: json['isPremiumOnly'] ?? false,
      createdById: json['createdById'] ?? 0,
      rsvp: json['rsvp'] ?? false,
      canJoin: json['canJoin'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'timezone': timezone,
      'zoomUrl': zoomUrl,
      'isPremiumOnly': isPremiumOnly,
      'createdById': createdById,
      'rsvp': rsvp,
      'canJoin': canJoin,
    };
  }
}
