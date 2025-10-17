
class EntryListModel {
  final String title;
  final String dateTime;
  final String description;
  final String prompt;

  EntryListModel({
    required this.title,
    required this.dateTime,
    required this.description,
    required this.prompt,
  });
}

final List<EntryListModel> entries = [
  EntryListModel(
    title: 'Today\'s Reflection',
    dateTime: 'Today, 10:30 AM',
    description:
        'I pulled The Star card today and felt an immediate sense of hope and renewal. The message resonated deeply with me as I\'ve been going through a period of uncertainty in my career.\n\n'
        'The card reminded me to trust in the universe\'s plan and have faith that everything is unfolding as it should. '
        'I\'m grateful for the small signs I\'ve been receiving that I\'m on the right path.\n\n'
        'Today, I\'m especially thankful for:\n'
        '- The supportive friends who listened to my concerns\n'
        '- The beautiful sunrise that greeted me this morning\n'
        '- The unexpected opportunity that came my way\n\n'
        'I\'m learning to embrace the journey rather than focusing solely on the destination.',
    prompt: 'Where in your life can you invite more trust and hope today?',
  ),
  EntryListModel(
    title: 'Morning Reflection',
    dateTime: 'Today, 7:00 AM',
    description:
        'I woke up feeling refreshed and pulled The Sun card. Its energy reminded me to lean into joy, optimism, and gratitude as I began the day. '
        'The warmth of the card felt like a gentle nudge to focus not on what’s missing but on what is already beautiful in my life.\n\n'
        'As I prepared for the day ahead, I felt lighter, as if the simple act of breathing in the morning air could fill me with strength. '
        'Sometimes happiness comes not from big events but from the little details we choose to notice.\n\n'
        'This morning, I am grateful for:\n'
        '- The refreshing sleep that left me energized\n'
        '- The bright sunlight pouring through my window\n'
        '- The chance to start this day with a positive outlook\n\n'
        'The Sun reminded me that each day is an invitation to shine my own light.',
    prompt: 'What is one simple joy you can fully appreciate this morning?',
  ),
  EntryListModel(
    title: 'Weekly Check-in',
    dateTime: 'Yesterday, 8:15 PM',
    description:
        'This week has been challenging, and I found myself pulled in many directions. When I paused for reflection, I pulled a card that urged me to lean into my intuition. '
        'At first, I questioned whether I was capable of trusting my inner voice, but as the week unfolded, I noticed how often my instincts quietly guided me.\n\n'
        'Even in difficult moments, I found that my intuition helped me make choices that felt more aligned with my truth. '
        'This card reminded me that not everything needs external validation — sometimes the answers lie within.\n\n'
        'This week, I am grateful for:\n'
        '- The moments of clarity when I listened to my gut feelings\n'
        '- The lessons I learned from facing obstacles head-on\n'
        '- The comfort of knowing growth often comes through challenges\n\n'
        'Looking back, I realize that even when life feels uncertain, trusting myself is a powerful compass.',
    prompt: 'How has trusting your intuition guided you this week?',
  ),
  EntryListModel(
    title: 'Evening Thoughts',
    dateTime: 'Monday, 5:45 PM',
    description:
        'Today was hectic and full of responsibilities. By the time evening arrived, I felt mentally and physically drained. '
        'When I pulled The Hermit card, its message of retreat and solitude struck me deeply. '
        'It reminded me that rest is not a weakness but a necessity for growth.\n\n'
        'As I sat quietly, I realized how important it is to disconnect from the noise and reconnect with myself. '
        'The Hermit encouraged me to embrace stillness, even if just for a few moments, so that I could find clarity beyond the chaos of the day.\n\n'
        'Tonight, I am grateful for:\n'
        '- The quiet moments of peace after a long day\n'
        '- The wisdom that comes when I listen to myself\n'
        '- The reminder that slowing down is part of the journey\n\n'
        'The Hermit showed me that sometimes, solitude is the light that guides us back home to ourselves.',
    prompt: 'What helps you find calm and clarity after a busy day?',
  ),
  EntryListModel(
    title: 'Weekend Reset',
    dateTime: 'Sunday, 9:30 AM',
    description:
        'This morning, I meditated on The Fool card. Its message of beginnings and fresh energy reminded me that life is not meant to be approached with fear but with openness and curiosity. '
        'Sometimes the unknown can feel intimidating, but The Fool invites me to see it as an adventure.\n\n'
        'As I reflected, I realized how often I hold myself back because I want certainty before I leap. '
        'Today, I felt a shift — a reminder that not every step needs a mapped-out plan. Sometimes faith is enough.\n\n'
        'This weekend, I am grateful for:\n'
        '- The chance to pause and reset before a new week begins\n'
        '- The courage to approach challenges with curiosity\n'
        '- The reminder that fresh starts are always possible\n\n'
        'The Fool inspired me to embrace the unknown, not with hesitation but with trust in the journey ahead.',
    prompt: 'What new beginning are you ready to embrace without hesitation?',
  ),
  EntryListModel(
    title: 'Daily Reflection',
    dateTime: 'Saturday, 6:10 PM',
    description:
        'The Tower card appeared in my reflection today. At first, it felt unsettling because of its association with sudden changes and disruption. '
        'But as I sat with the message, I realized that not all endings are destructive — many are opportunities for growth and transformation.\n\n'
        'This card reminded me to release control and trust that the breakdown of old patterns clears the way for something better. '
        'Even though change can be uncomfortable, I know that it often leads to breakthroughs I wouldn’t have reached otherwise.\n\n'
        'Today, I am grateful for:\n'
        '- The lessons hidden within challenges\n'
        '- The strength to let go of what no longer serves me\n'
        '- The new beginnings waiting on the other side of endings\n\n'
        'I close today with a deep sense of acceptance and a willingness to embrace whatever comes next.',
    prompt:
        'What change in your life might actually be opening the door to growth?',
  ),
];

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
