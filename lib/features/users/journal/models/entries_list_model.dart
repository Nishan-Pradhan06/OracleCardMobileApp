
enum JournalStatus { active, ephemeral, unknown }

JournalStatus journalStatusFromString(String? s) {
  if (s == null) return JournalStatus.unknown;
  final v = s.toLowerCase();
  if (v == 'active') return JournalStatus.active;
  if (v == 'ephemeral') return JournalStatus.ephemeral;
  return JournalStatus.unknown;
}

String journalStatusToString(JournalStatus status) {
  switch (status) {
    case JournalStatus.active:
      return 'ACTIVE';
    case JournalStatus.ephemeral:
      return 'EPHEMERAL';
    default:
      return 'UNKNOWN';
  }
}

class JournalDataModel {
  final List<JournalEntryListModel> items;
  final String? nextCursor;

  JournalDataModel({required this.items, this.nextCursor});

  factory JournalDataModel.fromJson(Map<String, dynamic> json) => JournalDataModel(
    items: (json['items'] as List<dynamic>)
        .map((e) => JournalEntryListModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextCursor: json['nextCursor'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'items': items.map((e) => e.toJson()).toList(),
    'nextCursor': nextCursor,
  };

  JournalDataModel copyWith({List<JournalEntryListModel>? items, String? nextCursor}) {
    return JournalDataModel(
      items: items ?? this.items,
      nextCursor: nextCursor ?? this.nextCursor,
    );
  }

  @override
  String toString() =>
      'JournalData(items: ${items.length}, nextCursor: $nextCursor)';
}

class JournalEntryListModel {
  final int id;
  final int userId;
  final int promptId;
  final String content;
  final JournalStatus status;
  final DateTime? expiresAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  JournalEntryListModel({
    required this.id,
    required this.userId,
    required this.promptId,
    required this.content,
    required this.status,
    this.expiresAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory JournalEntryListModel.fromJson(Map<String, dynamic> json) => JournalEntryListModel(
    id: json['id'] is int
        ? json['id'] as int
        : int.parse(json['id'].toString()),
    userId: json['userId'] is int
        ? json['userId'] as int
        : int.parse(json['userId'].toString()),
    promptId: json['promptId'] is int
        ? json['promptId'] as int
        : int.parse(json['promptId'].toString()),
    content: json['content'] as String,
    status: journalStatusFromString(json['status'] as String?),
    expiresAt: json['expiresAt'] == null
        ? null
        : DateTime.parse(json['expiresAt'] as String),
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: DateTime.parse(json['updatedAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'promptId': promptId,
    'content': content,
    'status': journalStatusToString(status),
    'expiresAt': expiresAt?.toIso8601String(),
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  JournalEntryListModel copyWith({
    int? id,
    int? userId,
    int? promptId,
    String? content,
    JournalStatus? status,
    DateTime? expiresAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return JournalEntryListModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      promptId: promptId ?? this.promptId,
      content: content ?? this.content,
      status: status ?? this.status,
      expiresAt: expiresAt ?? this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'JournalEntry(id: $id, userId: $userId, promptId: $promptId, status: $status, createdAt: $createdAt)';
  }
}
