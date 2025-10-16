

class PromptModel {
  final TodayPromptModel prompt;

  PromptModel({required this.prompt});

  factory PromptModel.fromMap(Map<String, dynamic> map) {
    return PromptModel(prompt: TodayPromptModel.fromMap(map['prompt'] ?? {}));
  }

  Map<String, dynamic> toMap() => {'prompt': prompt.toMap()};
}

class TodayPromptModel {
  final int id;
  final String text;
  final String visibility;
  final bool isActive;

  TodayPromptModel({
    required this.id,
    required this.text,
    required this.visibility,
    required this.isActive,
  });

  factory TodayPromptModel.fromMap(Map<String, dynamic> map) {
    return TodayPromptModel(
      id: map['id'] ?? 0,
      text: map['text'] ?? '',
      visibility: map['visibility'] ?? '',
      isActive: map['isActive'] ?? false,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'text': text,
    'visibility': visibility,
    'isActive': isActive,
  };
}
