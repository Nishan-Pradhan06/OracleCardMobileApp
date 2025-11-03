import 'today_prompt_model.dart';

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

  factory JournalDataModel.fromJson(Map<String, dynamic> json) =>
      JournalDataModel(
        items: (json['items'] as List<dynamic>? ?? [])
            .map(
              (e) => JournalEntryListModel.fromJson(
                (e ?? {}) as Map<String, dynamic>,
              ),
            )
            .toList(),
        nextCursor: json['nextCursor']?.toString(),
      );

  Map<String, dynamic> toJson() => {
    'items': items.map((e) => e.toJson()).toList(),
    'nextCursor': nextCursor,
  };

  JournalDataModel copyWith({
    List<JournalEntryListModel>? items,
    String? nextCursor,
  }) {
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
  final PromptModel prompt;

  JournalEntryListModel({
    required this.id,
    required this.userId,
    required this.promptId,
    required this.content,
    required this.status,
    this.expiresAt,
    required this.createdAt,
    required this.updatedAt,
    required this.prompt,
  });

  factory JournalEntryListModel.fromJson(Map<String, dynamic> json) =>
      JournalEntryListModel(
        id: json['id'] is int
            ? json['id'] as int
            : int.tryParse(json['id']?.toString() ?? '0') ?? 0,
        userId: json['userId'] is int
            ? json['userId'] as int
            : int.tryParse(json['userId']?.toString() ?? '0') ?? 0,
        promptId: json['promptId'] is int
            ? json['promptId'] as int
            : int.tryParse(json['promptId']?.toString() ?? '0') ?? 0,
        content: json['content']?.toString() ?? '',
        status: journalStatusFromString(json['status']?.toString()),
        expiresAt: json['expiresAt'] == null
            ? null
            : DateTime.tryParse(json['expiresAt'].toString()),
        createdAt:
            DateTime.tryParse(json['createdAt'].toString()) ??
            DateTime.fromMillisecondsSinceEpoch(0),
        updatedAt:
            DateTime.tryParse(json['updatedAt'].toString()) ??
            DateTime.fromMillisecondsSinceEpoch(0),
        prompt: json['prompt'] == null
            ? PromptModel.empty()
            : PromptModel.fromJson(json['prompt']),
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
    'prompt': prompt.toJson(),
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
    PromptModel? prompt,
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
      prompt: prompt ?? this.prompt,
    );
  }

  @override
  String toString() {
    return 'JournalEntry(id: $id, userId: $userId, promptId: $promptId, status: $status, createdAt: $createdAt, prompt: $prompt)';
  }
}
