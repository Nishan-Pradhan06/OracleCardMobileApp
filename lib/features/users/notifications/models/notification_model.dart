class NotificationModel {
  List<NotificationItemModel> items;
  String? nextCursor;
  int unreadCount;

  NotificationModel({
    required this.items,
    this.nextCursor,
    required this.unreadCount,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      items: (json['items'] as List)
          .map((item) => NotificationItemModel.fromJson(item))
          .toList(),
      nextCursor: json['nextCursor'],
      unreadCount: json['unreadCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
      'nextCursor': nextCursor,
      'unreadCount': unreadCount,
    };
  }
}

class NotificationItemModel {
  int id;
  String type;
  String title;
  String body;
  DateTime sentAt;
  DateTime? openedAt;

  NotificationItemModel({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    required this.sentAt,
    this.openedAt,
  });

  factory NotificationItemModel.fromJson(Map<String, dynamic> json) {
    return NotificationItemModel(
      id: json['id'],
      type: json['type'],
      title: json['title'],
      body: json['body'],
      sentAt: DateTime.parse(json['sentAt']),
      openedAt: json['openedAt'] != null
          ? DateTime.parse(json['openedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'body': body,
      'sentAt': sentAt.toIso8601String(),
      'openedAt': openedAt?.toIso8601String(),
    };
  }
}
