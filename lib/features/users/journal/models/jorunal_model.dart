import 'dart:convert';

class JournalEntryModel {
  final String content;
  final int promptId;

  JournalEntryModel({required this.content, required this.promptId});

  factory JournalEntryModel.fromMap(Map<String, dynamic> map) {
    return JournalEntryModel(
      content: map['content'] ?? '',
      promptId: map['promptId'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {'content': content, 'promptId': promptId};
  }

  factory JournalEntryModel.fromJson(String source) =>
      JournalEntryModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
