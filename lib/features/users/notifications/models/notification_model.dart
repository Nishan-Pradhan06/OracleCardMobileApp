import 'dart:convert';

class NotificationModel {
  final List<NotificationItemModel> items;
  final int? nextCursor; // cursor is integer in response
  final int unreadCount;

  NotificationModel({
    required this.items,
    this.nextCursor,
    required this.unreadCount,
  });

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      items: (map['items'] as List<dynamic>)
          .map((item) => NotificationItemModel.fromMap(item))
          .toList(),
      nextCursor: map['nextCursor'],
      unreadCount: map['unreadCount'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() => {
    'items': items.map((e) => e.toMap()).toList(),
    'nextCursor': nextCursor,
    'unreadCount': unreadCount,
  };

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}

class NotificationItemModel {
  final int id;
  final int userId;
  final String type;
  final String title;
  final String body;
  final DateTime sentAt;
   DateTime? openedAt;

  NotificationItemModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.body,
    required this.sentAt,
    this.openedAt,
  });

  factory NotificationItemModel.fromMap(Map<String, dynamic> map) {
    return NotificationItemModel(
      id: map['id'] ?? 0,
      userId: map['userId'] ?? 0,
      type: map['type'] ?? '',
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      sentAt: DateTime.tryParse(map['sentAt'] ?? '') ?? DateTime.now(),
      openedAt: map['openedAt'] != null
          ? DateTime.tryParse(map['openedAt'])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'userId': userId,
    'type': type,
    'title': title,
    'body': body,
    'sentAt': sentAt.toIso8601String(),
    'openedAt': openedAt?.toIso8601String(),
  };

  factory NotificationItemModel.fromJson(String source) =>
      NotificationItemModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
